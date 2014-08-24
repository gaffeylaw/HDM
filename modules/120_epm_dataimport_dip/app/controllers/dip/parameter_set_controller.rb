class Dip::ParameterSetController < ApplicationController
  layout "bootstrap_application_full"

  def odi_index
    respond_to do |format|
      format.html
    end
  end

  def infa_index
    respond_to do |format|
      format.html
    end
  end

  def report_index
    respond_to do |format|
      format.html
    end
  end

  def get_data
    parameter_sets = Dip::ParameterSet.where({:param_type => params[:param_type]}).order("name")
    datas, count = paginate(parameter_sets)
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def get_parameter_data
    param_type=params[:param_type]
    sql="select t1.*, t2.parameter_set_id"
    sql << " from (select * from dip_parameters t where t.param_type = '#{param_type}') t1"
    sql << " left join (select * "
    sql << " from dip_param_set_params t"
    sql << " where t.parameter_set_id = '#{params[:parameter_set_id]}') t2"
    sql << " on t1.id = t2.parameter_id order by t1.index_no"
    datas=Dip::Parameter.find_by_sql(Dip::Utils.paginate(sql, params[:start].to_i, params[:limit].to_i))
    count=Dip::Utils.get_count(sql);
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def create
    result={:success => true}
    parameter_set=Dip::ParameterSet.new({:param_type => params[:param_type], :name => params[:name]})
    unless (parameter_set.save)
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for(parameter_set)
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def destroy
    Dip::ParameterSet.find(params[:id]).destroy
    respond_to do |format|
      format.json {
        render :json => {}.to_json
      }
    end
  end

  def edit
    result={:success => true}
    parameter_set=Dip::ParameterSet.find(params[:id])
    unless (parameter_set.update_attributes({:name => params[:name]}))
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for(parameter_set)
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def add_parameter
    result={:success => true}
    begin
      parameter_set_id=params[:parameter_set_id]
      valueIds=params[:valueIds]
      ActiveRecord::Base.connection.execute("delete from dip_param_set_params t where t.parameter_set_id='#{parameter_set_id}'")
      valueIds.each do |v|
        Dip::ParamSetParam.new({:parameter_set_id => parameter_set_id, :parameter_id => v}).save
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
end
