module Dip
  module Jobs
    class ImportDataToTmpTableJob < Struct.new(:file, :templateId, :batchId, :currentPerson, :curCombination, :isBatchJob)
      @@batch_count=1000

      def perform
        Delayed::Worker.logger.info("#{Time.now}:Start job: batchId(#{batchId}) templateId(#{templateId}) isBatchJod(#{isBatchJob}) curCombination(#{curCombination})")
        Irm::Person.current=currentPerson
        @curCombination=curCombination
        save_xls_to_db(file, templateId, batchId, curCombination, isBatchJob)
      end

      private
      def save_xls_to_db(file, template_id, batchId, curCombination, isBatchJob)
        begin
          if (!isBatchJob)
            if curCombination
              ActiveRecord::Base.connection().execute("delete from #{Dip::Template.find(template_id).temporary_table} where template_id=\'#{template_id}\' and created_by=\'#{Irm::Person.current[:id]}\' and combination_record=\'#{curCombination}\'")
            else
              ActiveRecord::Base.connection().execute("delete from #{Dip::Template.find(template_id).temporary_table} where template_id=\'#{template_id}\' and created_by=\'#{Irm::Person.current[:id]}\' and combination_record is null")
            end
          end
          Dip::TemporaryTable.set_table_name(Dip::Template.find(template_id).temporary_table)
          flag=handleExcelFile(template_id, file, batchId, curCombination)
          if (!flag)
            return
          end
        rescue => err
          Delayed::Worker.logger.error err
          Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:import_to_tmp_error]})
        end
        doValidate(template_id, batchId, isBatchJob)
      end

      def saveDataList(list)
        connection=ActiveRecord::Base.connection.raw_connection
        connection.autocommit=false
        list.each do |column|
          #column.save
          connection.exec(column)
        end
        connection.commit
      end

      def doValidate(template_id, batchId, isBatchJob)
        Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:validating]})
        legal=true
        i=1
        Dip::TemplateColumn.where(:template_id => template_id).order(:index_id).each do |column|
          Dip::TemplateValidation.where(:template_column_id => column.id).each do |templateValidation|
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
              Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:program_exception]})
              Delayed::Worker.logger.error err
            end
          end
          i=i+1
        end
        if legal
          Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:transferring], :percent => 200})
          transfer_data_to_actual_table(template_id, batchId, isBatchJob)
        else
          Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:validate_error]})
        end
      end

      def transfer_data_to_actual_table(template_id, batchId, isBatchJob)
        template=Dip::Template.find(template_id)
        ActiveRecord::Base.connection.raw_connection.exec("begin dbms_stats.gather_table_stats(ownname => '#{DB_OWNER}',tabname => '#{template.temporary_table}',estimate_percent => dbms_stats.auto_sample_size); end;")
        #plsql.dbms_stats.gather_table_stats(:ownname => "#{DB_OWNER}", :tabname => "#{template.temporary_table}", :estimate_percent => 'dbms_stats.auto_sample_size')
        sql="plsql.#{template.import_program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{@curCombination}\',:overwrite=>#{!isBatchJob},:flag=>nil)"
        begin
          rs=eval(sql)
          if rs[:flag]
            Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:finished], :percent => 300})
            if template.end_program
              end_sql= "plsql.#{template.end_program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{@curCombination}\',:overwrite=>#{!isBatchJob},:flag=>nil)"
              eval(end_sql);
            end
          else
            Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:transfer_error]})
          end
        rescue => err
          Delayed::Worker.logger.error err
          Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:program_exception]})
        end
      end

      def handleExcelFile(template_id, file_name, batchId, curCombination)
        Delayed::Worker.logger.info("#{Time.now}:Loading excel ")
        begin
          workbook=nil
          if file_name.to_s.end_with?("xlsx")
            workbook = Roo::Excelx.new(file_name)
          else
            workbook = Roo::Excel.new(file_name)
          end
          Delayed::Worker.logger.info("#{Time.now}:Begin excel handling ")
          sheetCount=workbook.sheets.count
          template=Dip::Template.find(template_id)
          header_count=Dip::TemplateColumn.where(:template_id => template_id).size
          insert_sql="insert into #{template.temporary_table}("
          insert_sql << 'id'
          insert_sql << ',row_number'
          insert_sql << ',sheet_no'
          insert_sql << ',sheet_name'
          insert_sql << ',template_id'
          insert_sql << ',batch_id'
          insert_sql << ',combination_record'
          insert_sql << ',created_by'
          insert_sql << ',updated_by'
          insert_sql << ',created_at'
          insert_sql << ',updated_at'
          (1..header_count).each do |h|
            insert_sql << ",cols#{h}"
          end
          insert_sql << ')'
          row_count=0
          (0..(sheetCount-1)).each do |i|
            sheet=workbook.sheets[i]
            workbook.default_sheet=sheet
            row_count=row_count+(workbook.last_row || 0 )
          end
          handled_row_count=0
          (0..(sheetCount-1)).each do |i|
            sheet=workbook.sheets[i]
            workbook.default_sheet=sheet
            sheet_count=(workbook.last_row || 0 )
            page=(sheet_count+@@batch_count-1)/@@batch_count
            (0..(page-1)).each do |p|
              columns=[]
              start=p*@@batch_count+1
              last=(p+1)*@@batch_count
              if last >sheet_count
                last=sheet_count
              end
              (start..last).each do |j|
                unless row_empty?(workbook, j, header_count)
                  Dip::TemporaryTable.set_primary_key("id")
                  sql_stat="#{insert_sql} values ("
                  #column=Dip::TemporaryTable.new
                  sql_stat << "'#{UUID.new.generate(:compact)}'"
                  sql_stat << ",'#{j+1}'"
                  #column[:row_number]=j+1
                  sql_stat << ",'#{i}'"
                  #column[:sheet_no]= i
                  sql_stat << ",'#{sheet}'"
                  #column[:sheet_name]= sheet
                  sql_stat << ",'#{template_id}'"
                  #column[:template_id]=template_id
                  sql_stat << ",'#{batchId}'"
                  #column[:batch_id]= batchId
                  sql_stat << ",'#{curCombination}'"
                  sql_stat << ",'#{Irm::Person.current.id}'"
                  sql_stat << ",'#{Irm::Person.current.id}'"
                  sql_stat << ',sysdate'
                  sql_stat << ',sysdate'
                  #column[:combination_record]=curCombination
                  (1..header_count).each do |n|
                    cell=workbook.cell(j+1, n)
                    sql_stat << ",'#{get_cell_value(cell)}'"
                    #column["cols"+n.to_s]=get_cell_value(cell)
                  end
                  sql_stat << ")"
                  columns << sql_stat
                  #columns << column
                end
              end
              saveDataList(columns)
              handled_row_count+=(last-start+1)
              Delayed::Worker.logger.info("#{Time.now}:#{handled_row_count} records handled ")
              Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:percent => handled_row_count*100/row_count})
            end
          end
          workbook=nil
          GC.start
          return true
        rescue => ex
          Delayed::Worker.logger.error ex
          return false
        end

      end

      def row_empty?(workbook, row, header_count)
        str=""
        (1..header_count).each do |i|
          cell=workbook.cell(row+1, i)
          str+=cell.to_s.strip
        end
        if str.size <=0
          return true
        else
          return false
        end
      end

      def get_cell_value(cell)
        str=cell.to_s.strip
        str.to_s.gsub!(/\.0*\Z/, "")
        str.gsub!(/\s00:00:00\Z/, "")
        return str
      end
    end
  end
end
