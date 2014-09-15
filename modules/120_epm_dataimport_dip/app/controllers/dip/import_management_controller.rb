class Dip::ImportManagementController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def get_data
    order_name=params[:order_name]
    order_value=params[:order_value]
    start=params[:start].to_i
    limit=params[:limit].to_i
    order="created_at DESC"
    if (order_name)
      order=order_name +" "+order_value
    end
    sql="select i.* from dip_import_management i,dip_template t where i.template_id=t.id and i.created_by='#{Irm::Person.current.id}'"
    if params[:template_id]
      query_str=params[:template_id].to_s.gsub(/[';(\-\-)]/, " ")
      sql << " and upper(t.name) like upper('%#{query_str}%') "
      #ids=Dip::Template.where("name like ?", "%"+params[:template_id]+"%").collect { |t| "'"+t.id+"'" }.join(",")
    end
    sql << " order by i.#{order} "
    #dip_import_managements_scope = Dip::ImportManagement.where(:created_by => Irm::Person.current.id).order(order)
    #if ids
    #  if ids.length==0
    #    ids="'-1'"
    #  end
    #  dip_import_managements_scope=dip_import_managements_scope.where("template_id in (#{ids})")
    #end
    dip_import_managements=Dip::ImportManagement.find_by_sql(Dip::Utils.paginate(sql, start, limit))
    count=Dip::Utils.get_count(sql)
    #dip_import_managements, count = paginate(dip_import_managements_scope)
    respond_to do |format|
      format.html {
        @datas = dip_import_managements
        @count = count
      }
    end
  end

  def destroy
    begin
      id=params[:id]
      Dip::ImportManagement.where(:batch_id => id).first.destroy
      ActiveRecord::Base.connection.execute("delete from dip_error where batch_id='#{id}'")
    rescue => err
      logger.error(err)
    end
    respond_to do |format|
      format.html {
        redirect_to :action => :index
      }
    end
  end

  def query
    respond_to do |format|
      @headers=Dip::CombinationHeader.where({:combination_id => Dip::Template.find(params[:id]).combination_id}).order("header_id").collect { |h| h.header_id }.join(",")
      format.html
    end
  end

  def get_query_data
    data=[]
    count=0
    begin
      order_name=params[:order_name]
      order_value=params[:order_value]
      template=Dip::Template.find(params[:id])
      order= "v.combination_record"
      order << (Dip::Template.has_idx?(template[:query_view]) ? ",v.idx":"")
      if (order_name)
        order="v."+order_name +" "+order_value
      end
      start=params[:start].to_i
      limit=params[:limit].to_i
      batch_id=params[:batch_id]
      filter=[]
      Dip::TemplateColumn.where(:template_id => template.id).order(:index_id).each do |v|
        if params[v.view_column.to_s.downcase.strip]&& params[v.view_column.to_s.downcase.strip].size>0
          filter << v.view_column.to_s.upcase.strip
          filter << params[v.view_column.to_s.downcase.strip]
          break
        end
      end
      data, count=get_queried_data(order, template, start, limit, filter, params[:valueIds],batch_id)
    rescue
      logger.error "error:#{$!} at:#{$@}"
    end
    respond_to do |format|
      format.html {
        @datas=data
        @count=count
        @template=template
        @template_column=Dip::TemplateColumn.where(:template_id => @template.id).order(:index_id)
	@headers=Dip::CombinationHeader.find_by_sql("select t2.CODE,t1.HEADER_ID from DIP_COMBINATION_HEADERS t1,DIP_HEADER t2  where t1.HEADER_ID=t2.\"ID\" and t1.COMBINATION_ID='#{template[:combination_id]}'")      
	}
    end
  end

  def export_data
    batch_count=1000
    template=Dip::Template.find(params[:template_id])
    batch_id=params[:batch_id]
    file_path = create_folder
    file_name = template.name.to_s
    if params[:valueIds]
      params[:valueIds].each do |v|
        headerValue=Dip::HeaderValue.find(v)
        file_name << "_"
        file_name << headerValue.value
      end
    end
    file_name << "_#{batch_id}"
    order= "v.combination_record"
    sql=get_query_sql(order, template, params[:valueIds], batch_id)
    count=Dip::Utils.get_count(sql)
    page=(count+batch_count-1)/batch_count
    table_headers=[]
    if (params[:type]=="xlsx")
      file_name << ".xlsx"
      p = Axlsx::Package.new
      p.use_shared_strings = true
      workbook = p.workbook
      workbook.add_worksheet(:name => "data") do |sheet|
        template_columns=Dip::TemplateColumn.where(:template_id => template.id).order("index_id")
        header_row=[]
        template_columns.each do |t|
          table_headers << t[:view_column].to_s.downcase
          header_row << t[:name].to_s
        end
        combination_id=template.combination_id
        headers=Dip::CombinationHeader.where(:combination_id => combination_id).order("header_id")
        headers.each do |h|
          table_headers << "dip"+h.header_id.to_s.downcase
          header_row << Dip::Header.find(h.header_id).name.to_s
        end
        sheet.add_row(header_row, :types => Dip::Utils.get_type(header_row))
        if Dip::DipAuthority.authorized?(Irm::Person.current.id, template.id)
          (1..page).each do |i|
            start= (i-1)*batch_count
            datas=Dip::CommonModel.find_by_sql(Dip::Utils.paginate(sql, start, batch_count))
            #writeDataToExcel(datas, table_headers, file_path+file_name, start)
            datas.each do |data|
              row=[]
              table_headers.each do |h|
                row << column_data_format(data[h])
              end
              sheet.add_row(row, :types => Dip::Utils.get_type(row))
            end
          end
        end
      end
      p.serialize file_path+file_name
    else
      file_name << ".xls"
      workbook= Spreadsheet::Workbook.new
      sheet=workbook.create_worksheet(:name => 'data')
      template_columns=Dip::TemplateColumn.where(:template_id => template.id).order("index_id")
      template_columns.each do |t|
        table_headers << t[:view_column].to_s.downcase
        sheet.row(0).push(t.name.to_s)
      end
      combination_id=template.combination_id
      headers=Dip::CombinationHeader.where(:combination_id => combination_id).order("header_id")
      headers.each do |h|
        table_headers << "dip"+h.header_id.to_s.downcase
        sheet.row(0).push(Dip::Header.find(h.header_id).name.to_s)
      end
      if Dip::DipAuthority.authorized?(Irm::Person.current.id, template.id)
        (1..page).each do |i|
          start= (i-1)*batch_count
          datas=Dip::CommonModel.find_by_sql(Dip::Utils.paginate(sql, start, batch_count))
          datas.each do |data|
            idx=sheet.rows.count
            table_headers.each do |h|
              sheet.row(idx).push column_data_format(data[h])
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


  private
  def get_queried_data(order, template, start, limit, filter, valueIds,batch_id)
    sql=get_query_sql(nil, template, valueIds,batch_id)
    if filter && filter.size>0
      sql << " and v.#{filter[0]} like '%#{Dip::Utils.filter_sql(filter[1])}%'"
    end
    sql << " order by #{order}"
    data=Dip::CommonModel.find_by_sql(Dip::Utils.paginate(sql, start, limit))
    count=Dip::Utils.get_count(sql)
    return data, count
  end

  def get_query_sql(order, template, values,batch_id)
    if template.combination_id
      combination=Dip::Combination.where(:id => template[:combination_id]).first
      sql_select= "select v.*"
      from_sql=" from #{template.query_view} v, \"#{combination[:code]}\" c "
      where_sql=" where v.COMBINATION_RECORD = c.COMBINATION_RECORD and v.batch_id = '#{batch_id}'"
      if values
        Dip::CommonModel.find_by_sql("select t1.CODE,t2.HEADER_ID,t2.\"ID\" from"+
                                         " DIP_HEADER t1,DIP_HEADER_VALUE t2  where t1.\"ID\"=t2.HEADER_ID and t2.\"ID\" in(#{values.collect { |x| "'#{x}'" }.join(",")})").each do |h|
          where_sql << " and c.\"#{h[:code].to_s.upcase}\"='#{h[:id]}'"
        end
      end
      Dip::CombinationHeader.find_by_sql("select t1.HEADER_ID,t2.CODE from DIP_COMBINATION_HEADERS t1,DIP_HEADER t2 where t1.HEADER_ID=t2.\"ID\" and t1.COMBINATION_ID='#{template[:combination_id]}'").each_with_index do |h, i|
        sql_select << ",c.\"#{h[:code].to_s.upcase}\""
        sql_select << ",c.\"#{h[:code].to_s.upcase}_V\""
        from_sql << ",DIP_AUTHORITYXES auth#{i}"
        where_sql << " and auth#{i}.function=c.\"#{h[:code].to_s.upcase}\" and auth#{i}.function_type='VALUE' and auth#{i}.person_id='#{Irm::Person.current.id}'"
      end
      sql = sql_select
      sql << from_sql
      sql << where_sql
    else
      sql="select v.* from #{template.query_view} v where 1=1 "
    end
    if order
      sql << " order by #{order.upcase}"
    end
    return sql
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

  def column_data_format(value)
    if value==0
      return '0'
    end
    if value.nil?
      return ""
    elsif value.instance_of?(BigDecimal)
      return value.round(6).to_s('F').gsub(/\.?0*$/, "")
    elsif value.instance_of?(Float)
      return value.round(6).to_s.gsub(/\.?0*$/, "")
    elsif value.instance_of?(Time) || value.instance_of?(ActiveSupport::TimeWithZone)
      return value.strftime("%Y-%m-%d %H:%M:%S")
    else
      return value.to_s
    end
  end
end
