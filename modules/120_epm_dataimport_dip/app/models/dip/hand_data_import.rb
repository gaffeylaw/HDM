class Dip::HandDataImport
  @@batch_count=1000

  def hand_data_import(file, templateId, batchId, currentPerson, curCombination, isBatchJob)
    Irm::Person.current=currentPerson
    @curCombination=curCombination
    save_xls_to_db(file, templateId, batchId, curCombination, isBatchJob)
    File.delete file
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
      Rails.logger.error(err)
      Rails.logger.flush
      Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:import_to_tmp_error]})
    end
    doValidate(template_id, batchId, isBatchJob)
  end

  def saveDataList(list)
    ActiveRecord::Base.transaction do
      list.each do |column|
        column.save
      end
    end
  end

  def doValidate(template_id, batchId, isBatchJob)
    Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:validating]})
    legal=true
    i=1
    Dip::TemplateColumn.where(:template_id => template_id).order(:index_id).each do |column|
      Dip::TemplateValidation.where(:template_column_id => column.id).each do |templateValidation|
        validation=Dip::Validation.find(templateValidation.validation_id)
        sql=""
        sql << "plsql.#{validation.program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{@curCombination}\',:indexno=>#{i},:args=>\'#{templateValidation.args.to_s}\',:flag=>nil)"
        begin
          rs=eval(sql)
          if !rs[:flag]
            legal=false
          end
        rescue => err
          legal=false
          Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:program_exception]})
          Rails.logger.error(err)
          Rails.logger.flush
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
    sql="plsql.#{template.import_program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{@curCombination}\',:createdby=>\'#{Irm::Person.current.id}\',:batchinsert=>#{isBatchJob},:flag=>nil)"
    begin
      rs=eval(sql)
      if rs[:flag]
        Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:finished], :percent => 300})
      else
        Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:transfer_error]})
      end
    rescue => err
      Rails.logger.error err.to_s
      Rails.logger.flush
      Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:status => Dip::ImportStatus::STATUS[:program_exception]})
    end
  end

  def handleExcelFile(template_id, file_name, batchId, curCombination)
    begin
      file=Rjb::import("java.io.File")
      fileInputStream= Rjb::import("java.io.FileInputStream")
      workbookFactory=Rjb::import("org.apache.poi.ss.usermodel.WorkbookFactory")
      is=fileInputStream.new(file.new(file_name))
      workbook=workbookFactory.create(is)
      @workbook=workbook
      sheetCount=workbook.getNumberOfSheets()
      header_count=Dip::TemplateColumn.where(:template_id => template_id).size
      row_count=0
      (0..(sheetCount-1)).each do |i|
        sheet=workbook.getSheetAt(i)
        row_count=row_count+sheet.getLastRowNum()
      end
      handled_row_count=0
      (0..(sheetCount-1)).each do |i|
        sheet=workbook.getSheetAt(i)
        sheet_count=sheet.getLastRowNum()
        page=(sheet_count+@@batch_count-1)/@@batch_count
        (0..(page-1)).each do |p|
          columns=[]
          start=p*@@batch_count+1
          last=(p+1)*@@batch_count
          if last >sheet_count
            last=sheet_count
          end
          (start..last).each do |j|
            row=sheet.getRow(j)
            unless row_empty?(row, header_count)
              column=Dip::TemporaryTable.new
              column[:row_number]=j+1
              column[:template_id]=template_id
              column[:batch_id]= batchId
              column[:combination_record]=curCombination
              (1..header_count).each do |n|
                cell=row.getCell(n-1)
                column["cols"+n.to_s]=get_cell_value(cell)
              end
              columns << column
            end
          end
          saveDataList(columns)
          handled_row_count+=(last-start+1)
          Dip::ImportManagement.where(:batch_id => batchId).first.update_attributes({:percent => handled_row_count*100/row_count})
        end
      end
      return true
    rescue => ex
      Rails.logger.error(ex)
      Rails.logger.flush
      return false
    end

  end

  def row_empty?(row, header_count)

    if row.nil?
      return true
    end
    str=""
    (1..header_count).each do |i|
      cell=row.getCell(i-1)
      str+=get_cell_value(cell)
    end
    if str.size <=0
      return true
    else
      return false
    end
  end

  def get_cell_value(cell)
    str=""
    unless cell.nil?
      xcell=Rjb::import("org.apache.poi.ss.usermodel.Cell")
      dateUtil=Rjb::import("org.apache.poi.ss.usermodel.DateUtil")
      dateFormat=Rjb::import("java.text.SimpleDateFormat")
      type=cell.getCellType()
      case type
        when xcell.CELL_TYPE_BOOLEAN
          str= cell.getBooleanCellValue().to_s.strip
        when xcell.CELL_TYPE_NUMERIC
          if dateUtil.isCellDateFormatted(cell)
            date=dateUtil.getJavaDate(cell.getNumericCellValue())
            str= dateFormat.new("yyyy-MM-dd HH:mm:ss").format(date).to_s
          else
            str=cell.getNumericCellValue().to_s.strip
          end
        when xcell.CELL_TYPE_STRING
          str= cell.getStringCellValue().to_s.strip
        when xcell.CELL_TYPE_FORMULA
          evaluater= @workbook.getCreationHelper().createFormulaEvaluator()
          value=evaluater.evaluate(cell)
          str= value.formatAsString().to_s.strip
      end
    end
    str.gsub!(/\.0*\Z/, "")
    str.gsub!(/\s00:00:00\Z/, "")
    return str
  end
end