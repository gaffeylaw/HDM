module Dip
  module Jobs
    class ImportDataToTmpTableJob < Struct.new(:file, :templateId, :batchId, :currentPerson, :curCombination, :isBatchJob)
      @@batch_count=1000

      def perform
        require "rjb"
        jars = Dir.glob(Rails.root.to_s + "/lib/javalib/poi/*.jar").join(':')
        Rjb::load(jars, ['-Xmx200m'])
        Delayed::Worker.logger.info("#{Time.now}:Start job: batchId(#{batchId}) templateId(#{templateId}) isBatchJod(#{isBatchJob}) curCombination(#{curCombination})")
        Irm::Person.current=currentPerson
        @curCombination=curCombination
        save_xls_to_db(file, templateId, batchId, curCombination, isBatchJob)
      end

      private
      def save_xls_to_db(file, template_id, batchId, curCombination, isBatchJob)
        begin
          if curCombination
              ActiveRecord::Base.connection().execute("delete from #{Dip::Template.find(template_id).temporary_table} where template_id=\'#{template_id}\' and created_by=\'#{Irm::Person.current[:id]}\' and combination_record=\'#{curCombination}\'")
          else
              ActiveRecord::Base.connection().execute("delete from #{Dip::Template.find(template_id).temporary_table} where template_id=\'#{template_id}\' and created_by=\'#{Irm::Person.current[:id]}\' and combination_record is null")
          end
          Dip::TemporaryTable.set_table_name(Dip::Template.find(template_id).temporary_table)
          flag=handleExcelFile(template_id, file, batchId)
          if (!flag)
            status=Dip::ImportManagement.where(:batch_id => batchId).first
            status.update_attributes({:status => Dip::ImportStatus::STATUS[:interrupted]}) if status
          else
            doValidate(template_id, batchId, isBatchJob)
          end
        rescue => err
          Delayed::Worker.logger.error err
          Dip::Diperror.log(batchId,err,err)
          status=Dip::ImportManagement.where(:batch_id => batchId).first
          status.update_attributes({:status => Dip::ImportStatus::STATUS[:import_to_tmp_error]}) if status
        end
      end

      def saveDataList(list)
        connection=ActiveRecord::Base.connection.raw_connection
        connection.autocommit=false
        list.each do |column|
          connection.exec(column)
        end
        connection.commit
      end

      def doValidate(template_id, batchId, isBatchJob)
        status=Dip::ImportManagement.where(:batch_id => batchId).first
        status.update_attributes({:status => Dip::ImportStatus::STATUS[:validating]})  if status
        legal=true
        i=1
        Dip::TemplateColumn.where(:template_id => template_id).order(:index_id).each do |column|
          Dip::TemplateValidation.where(:template_column_id => column.id).order(:index_no).each do |templateValidation|
            validation=Dip::Validation.find(templateValidation.validation_id)
            sql=""
            sql << "plsql.#{validation.program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{@curCombination}\',:indexno=>#{i},:mmode=>\'#{isBatchJob ? 'M' : 'R'}\',:args=>\'#{templateValidation.args.to_s}\',:flag=>nil)"
            begin
              rs=eval(sql)
              if !rs[:flag]
                legal=false
              end
            rescue => err
              legal=false
              status=Dip::ImportManagement.where(:batch_id => batchId).first
              status.update_attributes({:status => Dip::ImportStatus::STATUS[:program_exception]}) if status
              Delayed::Worker.logger.error err
              Dip::Diperror.log(batchId,err,err)
            end
          end
          i=i+1
        end
        if legal
          status=Dip::ImportManagement.where(:batch_id => batchId).first
          status.update_attributes({:status => Dip::ImportStatus::STATUS[:transferring], :percent => 200}) if status
          transfer_data_to_actual_table(template_id, batchId, isBatchJob)
        else
          status=Dip::ImportManagement.where(:batch_id => batchId).first
          status.update_attributes({:status => Dip::ImportStatus::STATUS[:validate_error]}) if status
        end
      end

      def transfer_data_to_actual_table(template_id, batchId, isBatchJob)
        template=Dip::Template.find(template_id)
        ActiveRecord::Base.connection.raw_connection.exec("begin dbms_stats.gather_table_stats(ownname => '#{DB_OWNER}',tabname => '#{template.temporary_table}',estimate_percent => dbms_stats.auto_sample_size); end;")
        sql="plsql.#{template.import_program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{@curCombination}\',:overwrite=>#{!isBatchJob},:flag=>nil)"
        begin
          rs=eval(sql)
          if rs[:flag]
            if template.end_program
              end_sql="plsql.#{template.end_program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{@curCombination}\',:overwrite=>#{!isBatchJob},:flag=>nil)"
              rs1=eval(end_sql)
              if rs1[:flag]
                status=Dip::ImportManagement.where(:batch_id => batchId).first
                status.update_attributes({:status => Dip::ImportStatus::STATUS[:finished], :percent => 300}) if status
              else
                status=Dip::ImportManagement.where(:batch_id => batchId).first
                status.update_attributes({:status => Dip::ImportStatus::STATUS[:end_program_error]})  if status
              end
            else
              status=Dip::ImportManagement.where(:batch_id => batchId).first
              status.update_attributes({:status => Dip::ImportStatus::STATUS[:finished], :percent => 300}) if status
            end
          else
            status=Dip::ImportManagement.where(:batch_id => batchId).first
            status.update_attributes({:status => Dip::ImportStatus::STATUS[:transfer_error]})  if status
          end
        rescue => err
          Delayed::Worker.logger.error err
          Dip::Diperror.log(batchId,err,err)
          status=Dip::ImportManagement.where(:batch_id => batchId).first
          status.update_attributes({:status => Dip::ImportStatus::STATUS[:program_exception]})     if status
        end
      end

      def get_cell_value(cell)
        str=cell.to_s.strip
        str.to_s.gsub!(/\.0*\Z/, "")
        str.gsub!(/\s00:00:00\Z/, "")
        return str
      end

      def handleExcelFile(template_id, file_name, batchId)
        Delayed::Worker.logger.info("#{Time.now}:Start excel loading")
        begin
          template=Dip::Template.find(template_id)
          header_count=Dip::TemplateColumn.where(:template_id => template_id).size
          insert_sql="insert into #{template.temporary_table}("

          insert_sql << 'template_id'
          insert_sql << ',batch_id'
          insert_sql << ',combination_record'
          insert_sql << ',created_by'
          insert_sql << ',updated_by'
          insert_sql << ',created_at'
          insert_sql << ',updated_at'
          insert_sql << ',row_number'
          insert_sql << ',sheet_no'
          insert_sql << ',sheet_name'
          insert_sql << ',id'
          (1..header_count).each do |h|
            insert_sql << ",cols#{h}"
          end
          insert_sql << ')'
          sql_stat= insert_sql
          sql_stat << "values("
          sql_stat << "'#{template_id}'"
          sql_stat << ",'#{batchId}'"
          sql_stat << ",'#{@curCombination}'"
          sql_stat << ",'#{Irm::Person.current.id}'"
          sql_stat << ",'#{Irm::Person.current.id}'"
          sql_stat << ",sysdate"
          sql_stat << ",sysdate"
          sql_stat << ",?"#row_number
          sql_stat << ",?"#sheet_no
          sql_stat << ",?"#sheet_name
          sql_stat << ",?"#id
          (1..header_count).each do
            sql_stat << ",?"
          end
          sql_stat << ")"
          Delayed::Worker.logger.info("#{Time.now}:Start excel handling")
          userName=Ironmine::Application.config.database_configuration[Rails.env]["username"].to_s
          userPwd=Ironmine::Application.config.database_configuration[Rails.env]["password"].to_s
          host=Ironmine::Application.config.database_configuration[Rails.env]["host"].to_s
          database=Ironmine::Application.config.database_configuration[Rails.env]["database"].to_s
          port=Ironmine::Application.config.database_configuration[Rails.env]["port"].to_s
          reader=Rjb.import("org.hexj.RowReader")
          excelReaderUtil=Rjb.import("org.hexj.ExcelReaderUtil")
          Delayed::Worker.logger.info "jdbc:oracle:thin:@#{host}:#{port}:#{database}"
          Delayed::Worker.logger.info sql_stat
          excel_reader=reader.new("jdbc:oracle:thin:@#{host}:#{port}:#{database.split("\.")[0]}", userName, userPwd, sql_stat,"", header_count)
          excelReaderUtil.readExcel(excel_reader, file_name)
          excel_reader.end_read()
          status=Dip::ImportManagement.where(:batch_id => batchId).first
          status.update_attributes({:percent => 100}) if status
          return true
        rescue => ex
          Delayed::Worker.logger.info(ex)
          Dip::Diperror.log(batchId,ex,ex)
          return false
        end
      end

      def row_empty(row, header_count)
        return true if row.nil?
        (1..header_count).each do |i|
          cell=row.getCell(i-1)
          cell_str=getStringCellValue(cell)
          return false if cell_str.size>0
        end
        return true
      end

      def getStringCellValue(cell)
        if cell == nil
          return ""
        end
        hssfCell=Rjb::import("org.apache.poi.hssf.usermodel.HSSFCell")
        string=Rjb::import("java.lang.String")
        strCell = ""
        case cell.getCellType()
          when hssfCell.CELL_TYPE_STRING
            strCell = cell.getStringCellValue().strip
          when hssfCell.CELL_TYPE_NUMERIC
            strCell = sprintf("%.6g", cell.getNumericCellValue())
          when hssfCell.CELL_TYPE_BOOLEAN
            strCell = string.valueOf(cell.getBooleanCellValue())
        end
        return strCell
      end
    end
  end
end
