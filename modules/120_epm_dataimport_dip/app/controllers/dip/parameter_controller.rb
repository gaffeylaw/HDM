class Dip::ParameterController < ApplicationController
  layout "bootstrap_application_full"

  def odi_parameter
    respond_to do |format|
      format.html
    end
  end

  def infa_parameter
    respond_to do |format|
      format.html
    end
  end

  def report_parameter
    respond_to do |format|
      format.html
    end
  end

  def create
    result={:success => true}
    parameter=Dip::Parameter.new({
                                     :scope => params[:scope],
                                     :name => params[:name],
                                     :name_alias => params[:name_alias],
                                     :index_no => params[:index_no],
                                     :header_id => params[:header_id],
                                     :param_type => params[:param_type]
                                 })
    if (parameter.save)
      result[:msg]=[t(:label_operation_success)]
    else
      result[:success]=false
      result[:msg]=Dip::Utils.error_message_for(parameter)
    end
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
        ActiveRecord::Base.connection.execute("delete from dip_parameters t where t.id='#{v}'")
        ActiveRecord::Base.connection.execute("delete from dip_param_set_params t where t.parameter_id='#{v}'")
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
    parameter=Dip::Parameter.find(params[:id])
    new_parameter={
        :scope => params[:scope],
        :name => params[:name],
        :name_alias => params[:name_alias],
        :index_no => params[:index_no],
        :header_id => params[:header_id],
        :param_type => params[:param_type]
    }
    if (parameter.update_attributes(new_parameter))
      result[:msg]=[t(:label_operation_success)]
    else
      result[:success]=false
      result[:msg]=Dip::Utils.error_message_for(parameter)
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_odi_parameter
    parameters = Dip::Parameter.where(:param_type => Dip::DipConstant::PARAMETER_ODI).order("index_no")
    datas, count = paginate(parameters)
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def get_infa_parameter
    parameters = Dip::Parameter.where(:param_type => Dip::DipConstant::PARAMETER_INFA).order("index_no")
    datas, count = paginate(parameters)
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def get_report_parameter
    parameters = Dip::Parameter.where(:param_type => Dip::DipConstant::PARAMETER_REPORT).order("index_no")
    datas, count = paginate(parameters)
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end
end
