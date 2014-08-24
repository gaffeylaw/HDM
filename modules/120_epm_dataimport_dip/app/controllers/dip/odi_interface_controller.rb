class Dip::OdiInterfaceController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def create
    result={:success => true}
    interface=Dip::OdiInterface.new()
    interface[:interface_no]=params[:interface_no]
    interface[:interface_code]=params[:interface_code]
    interface[:interface_name]=params[:interface_name]
    interface[:interface_version]=params[:interface_version]
    interface[:interface_context]=params[:interface_context]
    interface[:interface_desc]=params[:interface_desc]
    interface[:server_id]=params[:interface_server]
    if (Dip::OdiServer.where(:id => params[:interface_server]).any?)
      interface[:server_version]="11"
    elsif (Dip::Odi10Server.where(:id => params[:interface_server]).any?)
      interface[:server_version]="10"
    end
    interface[:category_id]=params[:interface_category]
    if (interface.save)
      interface.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for(interface)
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end

  end

  def update
    result={:success => true}
    old_interface=Dip::OdiInterface.find(params[:id])
    interface={}
    interface[:interface_no]=params[:interface_no]
    interface[:interface_code]=params[:interface_code]
    interface[:interface_name]=params[:interface_name]
    interface[:interface_version]=params[:interface_version]
    interface[:interface_context]=params[:interface_context]
    interface[:interface_desc]=params[:interface_desc]
    interface[:server_id]=params[:interface_server]
    if (Dip::OdiServer.where(:id => params[:interface_server]).any?)
      interface[:server_version]="11"
    elsif (Dip::Odi10Server.where(:id => params[:interface_server]).any?)
      interface[:server_version]="10"
    end
    interface[:category_id]=params[:interface_category]
    if (old_interface.update_attributes(interface))
      old_interface.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for(old_interface)
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def destroy
    result={:success => true}
    begin
      valueIds=params[:valueIds]
      valueIds.each do |v|
        ActiveRecord::Base.connection.execute("delete from dip_odi_interfaces where id='#{v}'")
        ActiveRecord::Base.connection.execute("delete from dip_dip_authorities where function='#{v}'")
      end
      result[:msg]=[t(:label_operation_success)]
    rescue => ex
      result[:success]=false
      result[:msg]=[ex.to_s]
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_data
    category_id=params[:categoryId]
    if category_id.nil?
      interfaces=Dip::OdiInterface.order(:interface_no)
    elsif category_id=='unclassified'
      interfaces=Dip::OdiInterface.where(:category_id => nil).order(:interface_no)
    else
      interfaces=Dip::OdiInterface.where(:category_id => category_id).order(:interface_no)
    end
    interfaces=interfaces.match_value("interface_code", params[:interface_code])
    interfaces=interfaces.match_value("interface_name", params[:interface_name])
    data, count=paginate(interfaces)
    respond_to do |format|
      format.html {
        @datas=data
        @count=count
      }
    end
  end


  def bind_parameter_set
    result={:success => true}
    begin
      if params[:parameter_set_id].nil?
        ActiveRecord::Base.connection.execute("delete from dip_odi_parameters t where t.category_id='#{params[:category_id]}'")
      elsif Dip::OdiParameters.where({:category_id => params[:category_id]}).any?
        odi_parameter=Dip::OdiParameters.where({:category_id => params[:category_id]}).first
        odi_parameter.update_attributes({:parameter_set_id => params[:parameter_set_id]})
      else
        Dip::OdiParameters.new({:parameter_set_id => params[:parameter_set_id],
                                :category_id => params[:category_id]}).save
      end
      result[:msg]=[t(:label_operation_success)]
    rescue => ex
      result[:success]=false
      result[:msg]=[ex.to_s]
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_parameter_set
    odi_parameter=Dip::OdiParameters.where(:category_id => params[:category_id]).first
    respond_to do |format|
      format.json {
        render :json => (odi_parameter.nil? ? "" : odi_parameter.parameter_set_id).to_json
      }
    end
  end

  def run_interface
    respond_to do |format|
      format.html
    end
  end

  def get_run_data
    authorized=Dip::DipAuthority.get_all_authorized_data(Irm::Person.current.id, Dip::DipConstant::AUTHORITY_PERSON, Dip::DipConstant::AUTHORITY_ODI).collect { |a| "'"+a.function+"'" }.join(",")
    authorized="'-1'" if authorized.length==0
    sql=%Q(
    select distinct t1.*
      from dip_dip_categories t1, dip_odi_interfaces t2
     where t1.category_type = '#{Dip::DipConstant::CATEGORY_ODI}'
       and t1.id = t2.category_id
       and t2.id in (#{authorized})
       order by t1.name
    )
    datas=Dip::DipCategory.find_by_sql(Dip::Utils.paginate(sql,params[:start].to_i,params[:limit].to_i))
    count=Dip::Utils.get_count(sql)
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def get_interface
    data=[]
    count=0
    authorized=Dip::DipAuthority.get_all_authorized_data(Irm::Person.current.id, Dip::DipConstant::AUTHORITY_PERSON, Dip::DipConstant::AUTHORITY_ODI).collect { |a| "'"+a.function+"'" }.join(",")
    if authorized.to_s.length>0
      interfaces=Dip::OdiInterface.where("id in (#{authorized}) and category_id='#{params[:category_id]}'").order(:interface_no)
      data, count=paginate(interfaces)
    end
    respond_to do |format|
      format.html {
        @datas1=data
        @count1=count
      }
    end
  end

  def get_param
    parameter_set=Dip::OdiParameters.where(:category_id => params[:category_id]).first
    if (parameter_set)
      sql="select t2.* from dip_param_set_params t1,dip_parameters t2 where t1.parameter_id=t2.id and t1.parameter_set_id='#{parameter_set.parameter_set_id}' order by t2.index_no"
      data=Dip::Parameter.find_by_sql(Dip::Utils.paginate(sql, params[:start].to_i, params[:limit].to_i))
      count=Dip::Utils.get_count(sql)
    else
      data=[]
      count=0
    end
    respond_to do |format|
      format.html {
        @datas2=data
        @count2=count
      }
    end
  end

  def run
    result={:success => true, :msg => []}
    category_id=params[:category_id]
    ActiveRecord::Base.connection.execute("delete from dip_interface_statuses where interface_category_id='#{category_id}' and created_by='#{Irm::Person.current.id}'")
    interface_ids=params[:interface_ids]
    parameters=params[:parameters]
    variables=[]
    if parameters
      parameters.each do |p|
        kv={}
        odi_param=Dip::Parameter.find(p[0].to_s)
        kv[:name]=odi_param.name
        if odi_param.header_id
          kv[:value]=Dip::HeaderValue.find(p[1].to_s).code
        else
          kv[:value]=p[1].to_s
        end
        variables << kv
      end
    end
    if interface_ids
      interface_ids.each do |interface|
        odi_interface=Dip::OdiInterface.find(interface)
        if odi_interface.server_version=='10'
          odi_server=Dip::Odi10Server.find(odi_interface.server_id)
          begin
            client = Savon.client(odi_server[:service_url])
            response = client.request(:invokeScenario) do
              xml=""
              xml << "<ins0:RepositoryConnection>"
              xml << "<ins0:JdbcDriver>"
              xml << odi_server[:jdbc_driver].to_s
              xml << "</ins0:JdbcDriver>"
              xml << "<ins0:JdbcUrl>"
              xml << odi_server[:jdbc_url].to_s
              xml << "</ins0:JdbcUrl>"
              xml << "<ins0:JdbcUser>"
              xml << odi_server[:jdbc_user].to_s
              xml << "</ins0:JdbcUser>"
              xml << "<ins0:JdbcPassword>"
              xml << Dip::Des.decrypt(Base64.strict_decode64(odi_server[:jdbc_password])).to_s
              xml << "</ins0:JdbcPassword>"
              xml << "<ins0:OdiUser>"
              xml << odi_server[:odi_user].to_s
              xml << "</ins0:OdiUser>"
              xml << "<ins0:OdiPassword>"
              xml << Dip::Des.decrypt(Base64.strict_decode64(odi_server[:odi_password].to_s)).to_s
              xml << "</ins0:OdiPassword>"
              xml << "<ins0:WorkRepository>"
              xml << odi_server[:work_repository].to_s
              xml << "</ins0:WorkRepository>"
              xml << "</ins0:RepositoryConnection>"
              xml << "<ins0:Command>"
              xml << "<ins0:ScenName>"
              xml << odi_interface[:interface_code].to_s
              xml << "</ins0:ScenName>"
              xml << "<ins0:ScenVersion>"
              xml << odi_interface[:interface_version].to_s
              xml << "</ins0:ScenVersion>"
              xml << "<ins0:Context>"
              xml << odi_interface[:interface_context].to_s
              xml << "</ins0:Context>"
              xml << "<ins0:LogLevel>"
              xml << '5'
              xml << "</ins0:LogLevel>"
              xml << "<ins0:SyncMode>"
              xml << '0'
              xml << "</ins0:SyncMode>"
              xml << "<ins0:SessionName>"
              xml << odi_interface[:interface_code]+"_hdm"
              xml << "</ins0:SessionName>"
              variables.each do |v|
                xml << "<ins0:Variables>"
                xml << "<ins0:Name>#{v[:name]}</ins0:Name>"
                xml << "<ins0:Value>#{v[:value]}</ins0:Value>"
                xml << "</ins0:Variables>"
              end
              xml << "</ins0:Command>"
              xml << "<ins0:Agent>"
              xml << "<ins0:Host>"
              xml << odi_server[:agent_host].to_s
              xml << "</ins0:Host>"
              xml << "<ins0:Port>"
              xml << odi_server[:agent_port].to_s
              xml << "</ins0:Port>"
              xml << "</ins0:Agent>"
                soap.body=xml
            end
          rescue => error
            result[:success]=false
            result[:msg] << t(:label_interface)+" "+odi_interface[:interface_name].to_s+" "+t(:submit_fail)
            logger.error error
          end
          if response
            resp=response.to_hash
            session_id=resp[:invoke_scenario_response][:session_number].to_s
            Dip::InterfaceStatus.new({:interface_category_id => category_id, :interface_id => interface, :session_id => session_id}).save
          end
        elsif odi_interface.server_version=='11'
          begin
            odi_server=Dip::OdiServer.find(odi_interface.server_id)
            client = Savon.client(odi_server[:url])
            response = client.request(:invoke_start_scen) do
              xml=""
              xml << "<Credentials>"
              xml << "<OdiUser>"
              xml << odi_server[:odi_user]
              xml << "</OdiUser>"
              xml << "<OdiPassword>"
              xml << Dip::Des.decrypt(Base64.strict_decode64(odi_server[:odi_pwd]))
              xml << "</OdiPassword>"
              xml << "<WorkRepository>"
              xml << odi_server[:workspace]
              xml << "</WorkRepository>"
              xml << "</Credentials>"
              xml << "<Request>"
              xml << "<ScenarioName>"
              xml << odi_interface[:interface_code]
              xml << "</ScenarioName>"
              xml << "<ScenarioVersion>"
              xml << odi_interface[:interface_version]
              xml << "</ScenarioVersion>"
              xml << "<Context>"
              xml << odi_interface[:interface_context]
              xml << "</Context>"
              xml << "<Synchronous>"
              xml << "false"
              xml << "</Synchronous>"
              xml << "<SessionName>"
              xml << odi_interface[:interface_code]+"_hdm"
              xml << "</SessionName>"
              xml << "<Keywords/>"
              xml << "<LogLevel>5</LogLevel>"
              variables.each do |v|
                xml << "<Variables>"
                xml << "<Name>#{v[:name]}</Name>"
                xml << "<Value>#{v[:value]}</Value>"
                xml << "</Variables>"
              end
              xml << "</Request>"
              soap.body=xml
            end
          rescue => error
            result[:success]=false
            result[:msg] << t(:label_interface)+" "+odi_interface[:interface_name].to_s+" "+t(:submit_fail)
          end
          if response
            resp=response.to_hash
            session_id=resp[:odi_start_scen_response][:session]
            Dip::InterfaceStatus.new({:interface_category_id => category_id, :interface_id => interface, :session_id => session_id}).save
          end
        end
      end

      result[:category_id]=category_id
      respond_to do |format|
        format.json {
          if (result[:success])
            result[:msg] << t(:label_operation_success)
          end
          render :json => result.to_json
        }
      end
    end
  end

  def query_status
    interfaces=Dip::InterfaceStatus.where(:interface_category_id => params[:category_id], :created_by => Irm::Person.current.id)
    data, count=paginate(interfaces)
    respond_to do |format|
      format.html {
        @datas5=data
        @count5=count
      }
    end
  end

end
