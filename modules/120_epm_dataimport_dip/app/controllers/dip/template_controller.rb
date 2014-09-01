class Dip::TemplateController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def setting
    respond_to do |format|
      format.html
    end
  end

  def new
    @template=Dip::Template.new
    respond_to do |format|
      format.html
    end
  end

  def update
    @template=Dip::Template.find(params[:id])
    respond_to do |format|
      if @template.update_attributes(params[:dip_template])
        format.html { redirect_to({:action => "setting"}, :notice => t(:successfully_updated)) }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def edit
    @template=Dip::Template.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def get_ahead_data
    result=""
    q=params[:q]
    column_id=params[:column_id]
    combination_record=params[:combination_record]
    template_column=Dip::TemplateColumn.where(:id => column_id).first
    if template_column
      pk_cols= Dip::TemplateColumn.where(:template_id => template_column[:template_id], :is_pk => true).order(:index_id)
      program=template_column[:value_list]
      if program
        sql= "plsql."+program +"("
        sql << ":combinationrecord=>'#{combination_record}'"
        sql << ",:datainput=>'#{Dip::Utils.filter_sql(q)}'"
        pk_cols.each do |col|
          sql << ",:#{col.view_column.to_s.downcase}=>'#{params[col.view_column.to_s.downcase]}'"
        end
        sql << ",:cur=>nil) do |res| data=res[:cur].fetch_all  end"
        data=""
        p sql
        eval(sql)
        p data
        data.each do |d|
          result << "#{d[1]}|#{d[0]}\n"
        end
      end
    end
    respond_to do |format|
      format.json {
        render :json => result
      }
    end
  end

  def get_data_authorized
    templates=[]
    count=0
    order_name=params[:order_name]
    order_value=params[:order_value]
    start=params[:start].to_i
    limit=params[:limit].to_i
    order="name"
    if (order_name)
      order=order_name +" "+order_value
    end
    category_id=params[:category_id]
    sql="select t1.* from DIP_TEMPLATE t1,DIP_AUTHORITYXES t2 where t1.\"ID\"=t2.\"FUNCTION\" and t2.FUNCTION_TYPE='TEMPLATE' and t2.PERSON_ID='#{Irm::Person.current.id}'"
    if category_id
      categories=Dip::DipCategory.get_all_child(category_id)
      sql << " and  t1.template_category_id in (#{categories.collect { |c| "'#{c}'" }.join(",")})"
    else
      sql << ' and  t1.template_category_id is null'
    end
    if params[:name]
      sql << " and upper(t1.name) like upper('%#{Dip::Utils.filter_sql(params[:name])}%') "
    elsif params[:code]
      sql << " and upper(t1.name) like upper('%#{Dip::Utils.filter_sql(params[:code])}%') "
    elsif params[:descs]
      sql << " and upper(t1.name) like upper('%#{Dip::Utils.filter_sql(params[:descs])}%') "
    end
    sql << " order by t1.#{order} "
    templates=Dip::Template.find_by_sql(Dip::Utils.paginate(sql, start, limit))
    count=Dip::Utils.get_count(sql)

    respond_to do |format|
      format.html {
        @count = count
        @datas = templates
      }
    end
  end

  def create
    @template=Dip::Template.new(params[:dip_template])
    respond_to do |format|
      if @template.save
        columns=ActiveRecord::Base.connection().execute("select column_name,data_type,char_length from user_tab_columns where upper(table_name)=upper('#{@template.table_name}') order by column_id")
        view_columns=Dip::CommonModel.find_by_sql("select column_name from user_tab_columns where upper(table_name)=upper('#{@template.query_view}') order by column_id").collect { |c| c.column_name }
        i=1
        while row=columns.fetch
          unless ["ID", "CREATED_AT", "CREATED_BY", "BATCH_ID", "COMBINATION_RECORD", "UPDATED_AT", "UPDATED_BY"].include? row[0].to_s.upcase
            templateColumn=Dip::TemplateColumn.new
            templateColumn[:name]=row[0]
            templateColumn[:column_name]=row[0]
            templateColumn[:template_id]=@template.id
            templateColumn[:index_id]=i
            templateColumn[:data_type]=row[1]
            (templateColumn[:column_length]=row[2]*7<150 ? row[2]*7 : 150) if row[2]>0
            templateColumn[:view_column]= view_columns[i]
            templateColumn.save
            i=i+1
          end
        end
        columns.close
        format.html { redirect_to({:action => "edit", :id => @template[:id]}, :notice => t(:successfully_updated)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def destroy
    template=Dip::Template.find(params[:id])
    if !template.nil?
      template.destroy
    end
    respond_to do |format|
      format.html {
        redirect_to({:action => "setting"}, :notice => t(:successfully_updated))
      }
    end
  end

  def import
    respond_to do |format|
      format.html
    end
  end

  def export
    xls_path="";
    if params[:id].present?
      if !params[:id].nil?
        template=Dip::Template.where(:id => params[:id]).first
        xls_path=template.export_template(params[:id], params[:type])
      end
    end
    respond_to do |format|
      format.json {
        filename= xls_path.split("\/").last
        render :json => filename.to_json
      }
    end
  end

  def running?(pid_file)
    begin
      pid = IO.read(pid_file).to_i
      pid > 0 && Process.getpgid(pid) && true
    rescue
      false
    end
  end

  def upload
    flash[:errors]=[]
    pid_dir = "#{Rails.root}/tmp/pids"
    log_name_reg = /delayed_job\.(\d\.)?pid/
    delayed_job_num = 0
    Dir.entries(pid_dir).each do |entry|
      if entry.match(log_name_reg)
        if running?("#{pid_dir}/#{entry}")
          delayed_job_num += 1
        end
      end
    end

    if delayed_job_num == 0
      flash[:errors] << t(:label_delayed_job_not_start)
    else
      isBatchJob=params[:batchinsert]=="true" ? true : false
      if (params[:file].present?)
        if (params[:id])
          template=Dip::Template.find(params[:id])
          if (template)
            if (template.combination_id)
              logger.info("-------with combination---------")
              combination_record= Dip::Combination.get_combination_record(params[:key].values, template.combination_id)

              if (combination_record)
                if template_submitted?(template[:id], combination_record[:combination_record])
                  flash[:errors] << t(:label_combination_submitted)
                else
                  authorized=true
                  params[:key].values.each do |v|
                    unless Dip::DipAuthority.authorized?(Irm::Person.current.id, v)
                      authorized=false
                      break
                    end
                  end
                  if authorized
                    combination_record_id=combination_record.combination_record
                    file=Dip::Template.upload_file(params[:file][:file])
                    batchId=UUID.generate.to_s.gsub('-', '')
                    Dip::ImportManagement.new({:batch_id => batchId, :status => Dip::ImportStatus::STATUS[:importing_to_tmp], :template_id => params[:id], :percent => 0, :combination_record_id => combination_record_id}).save
                    #thread=Thread.new { Dip::HandDataImport.new().hand_data_import(file, params[:id], batchId, Irm::Person.current, combination_record_id, isBatchJob)}
                    #thread.run
                    #POOL.execute { Dip::HandDataImport.new().hand_data_import(file, params[:id], batchId, Irm::Person.current, combination_record_id, isBatchJob) }
                    Delayed::Job.enqueue(Dip::Jobs::ImportDataToTmpTableJob.new(file, params[:id], batchId, Irm::Person.current, combination_record_id, isBatchJob))
                  else
                    flash[:errors] << t(:label_not_authorized)
                  end
                end
              else
                flash[:errors] << t(:combination_not_right)
              end
            else
              logger.info("-------with no combination---------")
              file=Dip::Template.upload_file(params[:file][:file])
              batchId=UUID.generate.to_s.gsub('-', '')
              Dip::ImportManagement.new({:batch_id => batchId, :status => Dip::ImportStatus::STATUS[:importing_to_tmp], :template_id => params[:id], :percent => 0}).save
              #thread=Thread.new { Dip::HandDataImport.new().hand_data_import(file, params[:id], batchId, Irm::Person.current, combination_record_id, isBatchJob)}
              #thread.run
              #POOL.execute { Dip::HandDataImport.new().hand_data_import(file, params[:id], batchId, Irm::Person.current, combination_record_id, isBatchJob) }
              Delayed::Job.enqueue(Dip::Jobs::ImportDataToTmpTableJob.new(file, params[:id], batchId, Irm::Person.current, combination_record_id, isBatchJob))

            end
          else
            flash[:error] << t(:template_not_found)
          end
        else
          flash[:error] << t(:page_load_error)
        end
      else
        flash[:errors] << t(:notice_choose_file)
      end
    end

    respond_to do |format|
      format.html {
        if (flash[:errors].any?)
          redirect_to({:action => "import", :id => params[:id]})
        else
          redirect_to({:action => "index", :controller => "dip/import_management"})
        end
      }
    end
  end

  def next_value_list
    valueIds=params[:valueIds]
    templateId=params[:templateId]
    template=Dip::Template.where(:id => templateId).first
    combination=Dip::Combination.where(:id => template[:combination_id]).first
    headers=Dip::CombinationHeader.find_by_sql("SELECT t2.\"ID\",t2.CODE,t2.\"NAME\" FROM DIP_COMBINATION_HEADERS t1,DIP_HEADER t2 WHERE t2.\"ID\" = t1.HEADER_ID AND t1.COMBINATION_ID = '#{template[:combination_id]}' ORDER BY t1.HEADER_ID")
    sql="select distinct t1.\"#{headers[valueIds.length][:code].to_s.upcase}_V\" \"VALUE\",t1.\"#{headers[valueIds.length][:code].to_s.upcase}\" \"ID\" from \"#{combination[:code]}\" t1,DIP_AUTHORITYXES t2 where t1.enabled=1 and t2.function_type='VALUE' "
    sql << " and t2.person_id='#{Irm::Person.current.id}' and t1.\"#{headers[valueIds.length][:code].to_s.upcase}\"=t2.function"
    i=0
    valueIds.each do |v|
      sql << " and t1.\"#{headers[i][:code].to_s.upcase}\"='#{v}'"
      i=i+1
    end
    sql<< " order by t1.\"#{headers[valueIds.length][:code].to_s.upcase}\" "
    values=ActiveRecord::Base.connection().execute(sql)
    returnValue=[["", ""]]
    while (row=values.fetch)
      returnValue<<row
    end
    respond_to do |format|
      format.html {
        render :json => {:index => valueIds.length, :values => returnValue}
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
      order= "v.combination_record"
      if (order_name)
        order="v."+order_name +" "+order_value
      end
      template=Dip::Template.find(params[:id])
      start=params[:start].to_i
      limit=params[:limit].to_i
      filter=[]
      Dip::TemplateColumn.where(:template_id => template.id).order(:index_id).each do |v|
        if params[v.view_column.to_s.downcase.strip]&& params[v.view_column.to_s.downcase.strip].size>0
          filter << v.view_column.to_s.upcase.strip
          filter << params[v.view_column.to_s.downcase.strip]
          break
        end
      end
      data, count=get_queried_data(order, template, start, limit, filter, params[:valueIds])
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
    batch_count=5000
    template=Dip::Template.find(params[:template_id])
    file_path = create_folder
    file_name = template.name.to_s
    if params[:valueIds]
      params[:valueIds].each do |v|
        headerValue=Dip::HeaderValue.find(v)
        file_name << "_"
        file_name << headerValue.value
      end
    end
    file_name << "_#{Irm::Person.current.login_name}"
    order= "v.combination_record,v.row_id"
    sql=get_query_sql(order, template, params[:valueIds])
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
        headers=Dip::CombinationHeader.find_by_sql("SELECT t1.HEADER_ID,t2.CODE,t2.\"NAME\" FROM DIP_COMBINATION_HEADERS t1,DIP_HEADER t2 WHERE t1.HEADER_ID = t2.\"ID\" AND t1.COMBINATION_ID = '#{combination_id}' order by t1.header_id")
        headers.each do |h|
          table_headers << "#{h[:code].to_s.downcase}_v"
          header_row << h[:name]
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
              sheet.add_row(row)
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
      headers=Dip::CombinationHeader.find_by_sql("SELECT t1.HEADER_ID,t2.CODE,t2.\"NAME\" FROM DIP_COMBINATION_HEADERS t1,DIP_HEADER t2 WHERE t1.HEADER_ID = t2.\"ID\" AND t1.COMBINATION_ID = '#{combination_id}' order by t1.header_id")
      headers.each do |h|
        table_headers << "#{h[:code].to_s.downcase}_v"
        sheet.row(0).push(h[:name])
      end
      if Dip::DipAuthority.authorized?(Irm::Person.current.id, template.id)
        (1..page).each do |i|
          start= (i-1)*batch_count
          datas=Dip::CommonModel.find_by_sql(Dip::Utils.paginate(sql, start, batch_count))
          datas.each do |data|
            idx=sheet.rows.count
            table_headers.each do |h|
              sheet.row(idx).push data[h]
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

  def get_category_template
    order_name=params[:order_name]
    order_value=params[:order_value]
    order="name"
    if (order_name)
      order=order_name +" "+order_value
    end
    if params[:categoryId]
      if (params[:categoryId]=='unclassified')
        templates=Dip::Template.where("template_category_id is null").order(order)
      else
        categories=Dip::DipCategory.get_all_child(params[:categoryId])
        list= categories.empty? ? "('-1')" : "(#{categories.collect { |c| "'"+c+"'" }.join(",")})"
        templates=Dip::Template.where("template_category_id in #{list}").order(order)
      end

    else
      templates=Dip::Template.order(order)
    end
    templates = templates.match_value("#{Dip::Template.table_name}.name", params[:name])
    templates = templates.match_value("#{Dip::Template.table_name}.code", params[:code])
    templates = templates.match_value("#{Dip::Template.table_name}.descs", params[:descs])
    data, count = paginate(templates)
    respond_to do |format|
      format.html {
        @datas = data
        @count = count
      }
    end
  end

  def save_data
    result={:success => true}
    records=params[:records]
    templateId=params[:templateId]
    template=Dip::Template.find(templateId)
    Dip::TemporaryTable.set_table_name(template.temporary_table)
    Dip::TemporaryTable.set_primary_key("id")
    batchIds=[]
    combinationItems=[]
    records.values.each do |v|
      batchId=UUID.new.generate(:compact)
      column=Dip::TemporaryTable.new
      column[:id]=UUID.new.generate(:compact)
      column[:template_id]=template.id
      column[:batch_id]= batchId
      if (v["operation"]=="update")
        column[:target_id]=v["id"]
        Dip::CommonModel.set_table_name(template.table_name)
        Dip::CommonModel.set_primary_key "id"
        oldRecord=Dip::CommonModel.find_by_sql("select * from #{template.table_name} t where t.rowid='#{v["id"]}'").first
        if oldRecord
          column[:combination_record]=oldRecord.combination_record
        else
          column=nil
        end

      elsif v["operation"]=="create"
        if template.combination_id
          header_values=v["header_values"].to_hash
          combination_record=Dip::Combination.get_enabled_combination_record(header_values, template.combination_id)
          if !template.combination_id.nil? && combination_record.nil?
            result[:success]=false
            result[:msg]=[t(:combination_error)]
          else
            column[:combination_record]=combination_record.combination_record
          end
        end

      elsif v["operation"]=="delete"
        Dip::CommonModel.set_table_name(template.table_name)
        ActiveRecord::Base.connection().execute("delete from #{template.table_name} t where t.rowid='#{v["id"]}'")
        column=nil
      end
      unless column.nil?
        record_str=""
        i=1
        template_columns=Dip::TemplateColumn.where(:template_id => template.id).order("index_id")
        template_columns.each do |c|
          idx=template_columns.index(c)
          column["cols#{i}"]=v[c.view_column.to_s.downcase]
          record_str+= "  "+v[c.view_column.to_s.downcase].to_s
          i+=1
        end
        batchIds << batchId
        combinationItems << column[:combination_record]
        column.save
        res=doValidate(template.id, batchId, column[:combination_record])
        unless res.empty?
          result[:success]=false
          result[:msg]=["[#{record_str}]:"]+res
          break
        end
      end
    end
    if result[:success]
      begin
        result[:msg]=[t(:label_operation_success)]
        i=0
        batchIds.each do |batchId|
          transfer_data_to_actual_table(template.id, batchId, combinationItems[i], false)
          i+=1
        end
      rescue => ex
        result[:msg]=[ex.to_s]
      end
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def can_create_data
    result={:flag => true}
    unless Dip::Template.find(params[:templateId]).combination_id.nil?
      values=params[:values].to_hash
      values.values.each do |v|
        unless Dip::DipAuthority.authorized?(Irm::Person.current.id, v)
          result[:flag]=false
          result[:msg]=[t(:label_not_authorized)]
          break
        end
      end
      combinationRecord=Dip::Combination.get_enabled_combination_record(values, Dip::Template.find(params[:templateId]).combination_id)
      if combinationRecord.nil? || !combinationRecord[:enabled]
        result[:flag]=false
        result[:msg]=[t(:combination_error)]
      end
      result[:combination_record]=Dip::Template.find(params[:templateId]).combination_id
    end
    respond_to do |format|
      if result[:flag]
        columns=Dip::TemplateColumn.where(:template_id => params[:templateId]).order("index_id")
        result[:columns]=columns
      end
      format.json {
        render :json => result.to_json
      }
    end
  end

  def submit_data
    result={:flag => true}
    template_id=params[:templateId]
    valueIds=params[:valueIds]
    p '--------------------------------------------'
    p "select t1.*,UPPER(t2.CODE) from DIP_HEADER_VALUE t1,DIP_HEADER t2 where t1.HEADER_ID=t2.\"ID\" and t1.\"ID\" in (#{valueIds.collect { |x| "'#{x[1]}'" }.join(",")})"
    template=Dip::Template.where(:id => template_id).first
    combination=Dip::Combination.where(:id => template[:combination_id]).first
    if combination
      #With Combination
      sql="select * from \"#{combination[:code].to_s.upcase}\" where 1=1"
      Dip::HeaderValue.find_by_sql("select t1.*,UPPER(t2.CODE) \"HEADER_CODE\" from DIP_HEADER_VALUE t1,DIP_HEADER t2 where t1.HEADER_ID=t2.\"ID\" and t1.\"ID\" in (#{valueIds.collect { |x| "'#{x[1]}'" }.join(",")})").each do |h|
        sql << " and \"#{h[:header_code]}\"='#{h[:id]}'"
      end
      combination_record=Dip::CommonModel.find_by_sql(sql).first
      if template_submitted?(template_id, combination_record[:combination_record])
        result[:flag]=false
        result[:msg]=[t(:label_combination_submitted)]
      else
        apporvalStatus=Dip::ApprovalStatus.where({:template_id => template_id, :combination_record => combination_record[:combination_record]}).first
        if apporvalStatus
          apporvalStatus.update_attributes({:approval_status => "PROCESSING"})
        else
          Dip::ApprovalStatus.new({:combination_record => combination_record[:combination_record],
                                   :template_id => template_id,
                                   :approval_status => "PROCESSING"}).save
        end
        plsql.hdm_common_approval.generate_node(:personid => Irm::Person.current.id,
                                                :templateid => template_id,
                                                :combinationrecord => combination_record[:combination_record],
                                                :icommiter => Irm::Person.current.id,
                                                :cur_node_id => nil)
        result[:msg]=[t(:submit_successful)]
      end
    else
      #No Combination
      if template_submitted?(template_id, nil)
        result[:flag]=false
        result[:msg]=[t(:label_combination_submitted)]
      else
        apporvalStatus=Dip::ApprovalStatus.where({:template_id => template_id, :combination_record => nil}).first
        if apporvalStatus
          apporvalStatus.update_attributes({:approval_status => "PROCESSING"})
        else
          Dip::ApprovalStatus.new({:combination_record => nil,
                                   :template_id => template_id,
                                   :approval_status => "PROCESSING"}).save
        end
        plsql.hdm_common_approval.generate_node(:personid => Irm::Person.current.id,
                                                :templateid => template_id,
                                                :combinationrecord => nil,
                                                :icommiter => Irm::Person.current.id,
                                                :cur_node_id => nil)
        result[:msg]=[t(:submit_successful)]
      end
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end

  end

  private
  def get_queried_data(order, template, start, limit, filter, valueIds)
    sql=get_query_sql(nil, template, valueIds)
    if filter && filter.size>0
      sql << " and v.#{filter[0]} like '%#{Dip::Utils.filter_sql(filter[1])}%'"
    end
    sql << " order by #{order}"
    data=Dip::CommonModel.find_by_sql(Dip::Utils.paginate(sql, start, limit))
    count=Dip::Utils.get_count(sql)
    return data, count
  end

  def get_query_sql(order, template, values)
    if template.combination_id
      combination=Dip::Combination.where(:id => template[:combination_id]).first
      sql_select= "select v.*"
      from_sql=" from #{template.query_view} v, \"#{combination[:code]}\" c "
      where_sql=" where v.COMBINATION_RECORD = c.COMBINATION_RECORD"
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
        where_sql << " and auth#{i}.function=c.\"#{h[:code].to_s.upcase}\" and auth#{i}.function_type='VALUE'"
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

  def doValidate(template_id, batchId, combinationRecord)
    msg=[]
    i=1
    Dip::TemplateColumn.where(:template_id => template_id).order(:index_id).each do |column|
      Dip::TemplateValidation.where(:template_column_id => column.id).each do |templateValidation|
        legal=true
        validation=Dip::Validation.find(templateValidation.validation_id)
        sql=""
        sql << "plsql.#{validation.program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{combinationRecord}\',:indexno=>#{i},:mmode=>\'M\',:args=>\'#{templateValidation.args.to_s}\',:flag=>nil)"
        begin
          rs=eval(sql)
          if !rs[:flag]
            legal=false
          end
        rescue => err
          legal=false
          Rails.logger.error(err)
          Rails.logger.flush
        end
        if legal==false
          msg << "[#{validation.name}] #{t(:validation_fail)}"
        end
      end
      i+=1
    end
    msg
  end

  def transfer_data_to_actual_table(template_id, batchId, combinationRecord, overwrite)
    template=Dip::Template.find(template_id)
    sql="plsql.#{template.import_program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{combinationRecord}\',:overwrite=>#{overwrite},:flag=>nil)"
    rs=eval(sql)
    if template.end_program
      end_sql="plsql.#{template.import_program}(:batchid=>\'#{batchId}\',:templateid=>\'#{template_id}\',:combinationrecord=>\'#{combinationRecord}\',:overwrite=>#{overwrite},:flag=>nil)"
      eval(end_sql)
    end
  end

  def filter_column(column_name)
    if ['created_at', 'created_by', 'updated_by', 'updated_at', 'combination_record', 'row_id', 'id'].include? column_name.to_s.downcase
      return true
    end
    return false
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

  def template_submitted?(template_id, combination_id)
    apporvalStatus=Dip::ApprovalStatus.where({:template_id => template_id, :combination_record => combination_id}).first
    p apporvalStatus.to_json
    if apporvalStatus&&apporvalStatus[:approval_status]!='REJECT'
      return true
    else
      return false
    end
  end
end
