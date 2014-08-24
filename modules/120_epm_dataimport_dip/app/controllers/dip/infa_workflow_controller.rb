class Dip::InfaWorkflowController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def get_data
    category_id=params[:categoryId]
    if category_id.nil?
      workflows=Dip::InfaWorkflow.order("folder_name,name_alias")
    elsif category_id=='unclassified'
      workflows=Dip::InfaWorkflow.where(:category_id => nil).order("folder_name,name_alias")
    else
      workflows=Dip::InfaWorkflow.where(:category_id => category_id).order("folder_name,name_alias")
    end
    workflows=workflows.match_value("name", params[:name])
    workflows=workflows.match_value("name_alias", params[:name_alias])
    datas, count=paginate(workflows)
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def get_run_data
    authorized=Dip::DipAuthority.get_all_authorized_data(Irm::Person.current.id, Dip::DipConstant::AUTHORITY_PERSON, Dip::DipConstant::AUTHORITY_INFORMATICA).collect { |a| "'"+a.function+"'" }.join(",")
    authorized="'-1'" if authorized.length==0
    sql=%Q(
    select distinct t1.*
      from dip_dip_categories t1, dip_infa_workflows t2
     where t1.category_type = '#{Dip::DipConstant::CATEGORY_INFA}'
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

  def run
    respond_to do |format|
      format.html
    end
  end

  def run_workflow
    result={:success => true, :msg => []}
    category_id=params[:category_id]
    ActiveRecord::Base.connection.execute("delete from dip_infa_wkfl_statuses where workflow_set_id='#{category_id}' and created_by='#{Irm::Person.current.id}'")
    workflow_ids=params[:workflow_ids]
    parameters=params[:parameters]
    workflow_ids.each do |w|
      workflow=Dip::InfaWorkflow.find(w)
      repository=Dip::InfaRepository.find(workflow[:repository_id])
      sessionId=Dip::InfaRepository.login(repository)
      server=Dip::InfaRepository.get_a_diServer(repository, sessionId)
      return_value=Dip::InfaRepository.start_workflow(repository, sessionId, workflow, server, parameters)
      Dip::InfaWkflStatus.new({:workflow_set_id => category_id, :workflow_id => w, :run_id => return_value}).save
      Dip::InfaRepository.logout(repository, sessionId)
    end
    respond_to do |format|
      result[:category_id]=category_id
      format.json {
        if (result[:success])
          result[:msg] << t(:label_operation_success)
        end
        render :json => result.to_json
      }
    end
  end

  def get_run_status
    status=Dip::InfaWkflStatus.where({:workflow_set_id => params[:category_id], :created_by => Irm::Person.current.id})
    data, count=paginate(status)
    respond_to do |format|
      format.html {
        @datas5 = data
        @count5 = count
      }
    end
  end

  def destroy
    result={:success => true}
    begin
      valueIds=params[:valueIds]
      valueIds.each do |v|
        ActiveRecord::Base.connection.execute("delete from dip_infa_workflows where id='#{v}'")
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

  def update
    result={:success => true}
    workflow=Dip::InfaWorkflow.find(params[:id])
    interface={}
    interface[:name]=params[:name]
    interface[:name_alias]=params[:name_alias]
    interface[:folder_name]=params[:folder_name]
    interface[:repository_id]=params[:repository]
    interface[:category_id]=params[:category]
    if (workflow.update_attributes(interface))
      workflow.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for(workflow)
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_authorized_workflow
    datas=[]
    count=0
    authorized=Dip::DipAuthority.get_all_authorized_data(Irm::Person.current.id, Dip::DipConstant::AUTHORITY_PERSON, Dip::DipConstant::AUTHORITY_INFORMATICA).collect { |a| "'"+a.function+"'" }.join(",")
    if authorized.to_s.length>0
      workflows=Dip::InfaWorkflow.where("id in (#{authorized}) and category_id='#{params[:category_id]}'").order(:name_alias)
      datas,count=paginate(workflows)
    end
    respond_to do |format|
      format.html {
        @datas1 = datas
        @count1 = count
      }
    end
  end

  def get_param
    parameter_set=Dip::InfaParameters.where(:category_id => params[:category_id]).first
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
        @datas2 = data
        @count2 = count
      }
    end
  end

  def create
    result={:success => true}
    interface=Dip::InfaWorkflow.new()
    interface[:name]=params[:name]
    interface[:name_alias]=params[:name_alias]
    interface[:folder_name]=params[:folder_name]
    interface[:repository_id]=params[:repository]
    interface[:category_id]=params[:category]
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

  def bind_parameter_set
    result={:success=>true}
    begin
      if params[:parameter_set_id].nil?
        ActiveRecord::Base.connection.execute("delete from dip_infa_parameters t where t.category_id='#{params[:category_id]}'")
      elsif Dip::InfaParameters.where({:category_id => params[:category_id]}).any?
        infa_parameter=Dip::InfaParameters.where({:category_id => params[:category_id]}).first
        infa_parameter.update_attributes({:parameter_set_id => params[:parameter_set_id]})
      else
        Dip::InfaParameters.new({:parameter_set_id => params[:parameter_set_id],
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
    infa_parameter=Dip::InfaParameters.where(:category_id => params[:category_id]).first
    respond_to do |format|
      format.json {
        render :json => (infa_parameter.nil? ? "" : infa_parameter.parameter_set_id).to_json
      }
    end
  end
end
