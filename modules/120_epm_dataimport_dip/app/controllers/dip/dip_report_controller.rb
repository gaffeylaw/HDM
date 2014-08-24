class Dip::DipReportController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def query
    respond_to do |format|
      format.html
    end
  end

  def new
    @report=Dip::DipReport.new
    respond_to do |format|
      format.html
    end
  end

  def get_data
    if params[:categoryId]
      categories=Dip::DipCategory.get_all_child(params[:categoryId])
      list= categories.empty? ? "('-1')" : "(#{categories.collect { |c| "'"+c+"'" }.join(",")})"
      reports=Dip::DipReport.where("category_id in #{list}").order("name")
    else
      reports=Dip::DipReport.order("name")
    end
    reports = reports.match_value("#{Dip::DipReport.table_name}.name", params[:name])
    data, count = paginate(reports)
    respond_to do |format|
      format.html {
        @datas = data
        @count = count
      }
    end
  end

  def edit
    @report=Dip::DipReport.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def create
    @report=Dip::DipReport.new(params[:dip_dip_report])
    respond_to do |format|
      if (@report.save)
        format.html { redirect_to({:action => "index"}) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if (Dip::DipReport.find(params[:id]).update_attributes(params[:dip_dip_report]))
        format.html { redirect_to({:action => "index"}) }
      else
        format.html { render :action => "edit", :id => params[:id] }
      end
    end
  end

  def destroy
    Dip::DipReport.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to({:action => "index"}) }
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def get_data_authorized
    reports=[]
    count=0
    start=params[:start]
    limit=params[:limit]
    authorized_reports=Dip::DipAuthority.get_all_authorized_data(Irm::Person.current.id, Dip::DipConstant::AUTHORITY_PERSON, Dip::DipConstant::AUTHORITY_REPORT).collect { |a| "'"+a.function+"'" }.join(",")
    if !authorized_reports.nil? && authorized_reports.size > 0
      sql="select distinct t.* from dip_dip_reports t where t.id in (#{authorized_reports})"
      if params[:categoryId]
        categories=Dip::DipCategory.get_all_child(params[:categoryId])
        list= categories.empty? ? "('-1')" : "(#{categories.collect { |c| "'"+c+"'" }.join(",")})"
        sql << " and  t.category_id in #{list}"
      end
      if params[:name]
        sql << " and upper(t.name) like upper('%#{Dip::Utils.filter_sql(params[:name])}%') "
      end
      sql << " order by t.name"
      reports=Dip::DipReport.find_by_sql(Dip::Utils.paginate(sql, start, limit))
      count=Dip::Utils.get_count(sql)
    end
    respond_to do |format|
      format.html {
        @datas = reports
        @count = count
      }
    end
  end

  #def export
  #  reportId=params[:reportId]
  #  values=params[:valueIds]
  #  page_size=1000
  #  report=Dip::DipReport.find(reportId)
  #  type=params[:type]
  #  file_name=report.name+"_"+Irm::Person.current.login_name
  #  if type=="xlsx"
  #    file_name << ".xlsx"
  #  else
  #    file_name << ".xls"
  #  end
  #  path=create_folder
  #  create_excel_header(report, path+file_name)
  #  if Dip::DipAuthority.authorized?(Irm::Person.current.id, report.id)
  #    data, count=get_report_data_paged(report, values, 0, 1)
  #    page=(count+page_size-1)/page_size
  #    headers=report.columns.downcase.split("|")
  #    (1..page).each do |i|
  #      data, count=get_report_data_paged(report, values, i-1, page_size)
  #      writeDataToExcel(data, headers, path+file_name, (i-1)*page_size)
  #    end
  #  end
  #  respond_to do |format|
  #    format.json {
  #      render :json => file_name.to_json
  #    }
  #  end
  #end

  def export
    reportId=params[:reportId]
    values=params[:valueIds]
    type=params[:type]
    batch_count=1000
    report=Dip::DipReport.find(reportId)
    file_path = create_folder
    file_name = report.name.to_s

    file_name << "_#{Irm::Person.current.login_name}"
    count=get_report_data_paged(report, values, 0, 1)[1]

    page=(count+batch_count-1)/batch_count
    table_headers= report.columns_desc.split("|")
    if (params[:type]=="xlsx")
      file_name << ".xlsx"
      p = Axlsx::Package.new
      p.use_shared_strings = true
      workbook = p.workbook
      workbook.add_worksheet(:name => "data") do |sheet|
        sheet.add_row(table_headers,:types=>Dip::Utils.get_type(table_headers))
        if Dip::DipAuthority.authorized?(Irm::Person.current.id, report.id)
          (1..page).each do |i|
            start= (i-1)*batch_count
            datas=get_report_data_paged(report, values, start, batch_count)[0]
            datas.each do |data|
              row=[]
              report.columns.split("|").each do |h|
                row << data[h.to_s.downcase].to_s
              end
              sheet.add_row(row,:types=>Dip::Utils.get_type(row))
            end
          end
        end
      end
      p.serialize file_path+file_name
    else
      file_name << ".xls"
      workbook= Spreadsheet::Workbook.new
      sheet=workbook.create_worksheet(:name => 'data')
      report.columns_desc.split("|").each do |h|
        sheet.row(0).push(h.to_s)
      end
      if Dip::DipAuthority.authorized?(Irm::Person.current.id, report.id)
        (1..page).each do |i|
          start= (i-1)*batch_count
          datas=get_report_data_paged(report, values, start, batch_count)[0]
          datas.each do |data|
            idx=sheet.rows.count
            report.columns.split("|").each do |h|
              sheet.row(idx).push data[h.to_s.downcase].to_s
            end
          end
        end
      end
      workbook.write file_path+file_name
    end
    respond_to do |format|
      format.json {
        render :json => (file_name).to_json
      }
    end
  end

  def get_report_data
    reportId=params[:reportId]
    values=params[:valueIds]
    report=Dip::DipReport.find(reportId)
    start=params[:start]
    limit=params[:limit]
    datas=[]
    count=0
    if Dip::DipAuthority.authorized?(Irm::Person.current.id, report.id)
      datas, count=get_report_data_paged(report, values, start, limit)
    end

    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
        @headers=report.columns.downcase.split("|")
        @header_titles=report.columns_desc.split("|")

      }
    end
  end

  def get_report_data_paged(report, values, start, limit)
    datas=[]
    count=0
    if report.is_pkg
      plsqlx=plsql
      unless report.db_info.nil?
        db_info=Dip::DatabaseInfo.find(report.db_info)
        plsqlx=PLSQL::Schema.new
        plsqlx.connection=OCI8.new("#{db_info.db_user}/#{db_info.db_pwd}@//#{db_info.db_addr}:#{db_info.db_port}/#{db_info.db_name}")
      end
      sql="plsqlx."
      sql << report.program
      sql << "("
      i=0
      Dip::CombinationHeader.where(:combination_id => report.combination_id).order("header_id").each do |h|
        if values["#{i.to_s}"] && (value=values["#{i.to_s}"].join(",")).length>0
          sql << ":values#{i.to_s}=>'#{value}',"
        else
          sql << ":values#{i.to_s}=>nil,"
        end
        i+=1
      end
      sql << ":count_start=>#{start},"
      sql << ":count_limit=>#{limit},"
      sql << ":cur=>nil,"
      sql << ":total_count=>nil) do |res|;count=res[:total_count];data=res[:cur].fetch_all; headers=res[:cur].fields;end"
      data=[]
      count=0
      headers=[]
      eval(sql)

      data.each do |d|
        i=0
        query_data=Dip::QueryModel.new()
        query_data.list={}
        headers.each do |h|
          query_data.list["#{h.to_s.downcase.strip}"]=d[i]
          i+=1
        end
        datas << query_data
      end
    else
      if (report.db_info.nil?)
        datas=Dip::CommonModel.find_by_sql(Dip::Utils.paginate(report.program, start, limit))
        count=Dip::Utils.get_count(report.program)
      else
        db_info=Dip::DatabaseInfo.find(report.db_info)
        connection=OCI8.new("#{db_info.db_user}/#{db_info.db_pwd}@//#{db_info.db_addr}:#{db_info.db_port}/#{db_info.db_name}")
        cursor=connection.exec(Dip::Utils.paginate(report.program, start, limit))
        count= (connection.exec("select count(*) from (#{report.program})").fetch)[0]
        sql_headers=cursor.get_col_names
        while (row=cursor.fetch)
          query_data=Dip::QueryModel.new()
          query_data.list={}
          (0..sql_headers.size-1).each do |i|
            query_data.list[sql_headers[i].to_s.downcase]=row[i]
          end
          datas << query_data
        end
        cursor.close
      end
    end
    return datas, count
  end

  def create_folder
    model_folder= File.expand_path("../../../../../../public/upload", __FILE__)
    if !File.exist? model_folder
      FileUtils.mkdir(model_folder)
    end
    if (!File.exist?(model_folder+"/epm"))
      FileUtils.mkdir(model_folder+"/epm")
    end
    if (!File.exist?(model_folder+"/epm/data"))
      FileUtils.mkdir(model_folder+"/epm/data")
    end
    path=model_folder+"/epm/data/"
  end

  #def writeDataToExcel(datas, table_headers, file_name, start)
  #  file=Rjb::import("java.io.File")
  #  fileInputStream= Rjb::import("java.io.FileInputStream")
  #  workbookFactory=Rjb::import("org.apache.poi.ss.usermodel.WorkbookFactory")
  #  fileOutputStream=Rjb::import("java.io.FileOutputStream")
  #  is=fileInputStream.new(file.new(file_name))
  #  workbook=workbookFactory.create(is)
  #  sheet=workbook.getSheetAt(0)
  #  n= start+1
  #  datas.each do |data|
  #    row=sheet.createRow(n)
  #    m=0
  #    table_headers.each do |h|
  #      cell=row.createCell(m)
  #      cell.setCellValue(data[h].to_s)
  #      m+=1
  #    end
  #    n+=1
  #  end
  #  os = fileOutputStream.new(file.new(file_name))
  #  workbook.write(os)
  #  os.close()
  #  is.close()
  #end

end
