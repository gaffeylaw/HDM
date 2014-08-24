class Dip::TemplateValidationController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def create
    result={:success => true}
    template_validation=Dip::TemplateValidation.new({:validation_id => params[:validation_id],:index_no=>params[:index_no],:args => params[:args], :template_column_id => params[:columnId]})
    if (template_validation.save)
      template_validation.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for template_validation
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def new
    if (!params[:columnId].nil?)
      @template_validation=Dip::TemplateValidation.new({:template_column_id => params[:columnId]})
      #existed_validation=Dip::TemplateValidation.where(:template_column_id => params[:columnId])
      #if (existed_validation.any?)
      #  existed_validate_id=existed_validation.collect { |validate| "\'"+validate[:validation_id]+"\'" }.join(",")
      #  @validation_list=Dip::Validation.where("id not in (select )").order(:name)
      #else
      #  @validation_list=Dip::Validation.order(:name)
      #end
      @validation_list=Dip::Validation.where("#{Dip::Validation.table_name}.id not in (select v.validation_id from dip_template_validation v where v.template_column_id='#{params[:columnId]}')").order(:name)
      respond_to do |format|
        format.json {
          render :json => @validation_list.collect { |c| [c.name, c.id] }
        }
      end
    end
  end

  def edit
    @template_validation=Dip::TemplateValidation.find(params[:validationId])
    respond_to do |format|
      format.json {
        render :json => @template_validation.to_json
      }
    end
  end

  def update
    result={:success => true}
    @template_validation=Dip::TemplateValidation.find(params[:id])
    if (@template_validation.update_attributes({:args => params[:args],:index_no=>params[:index_no]}))
      @template_validation.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for @template_validation
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def destroy
    result={:success => true}
    begin
      template_validation=Dip::TemplateValidation.find(params[:id])
      template_validation.destroy
      result[:msg]=[t(:label_operation_success)]
    rescue
      result[:success]=false
      result[:msg]=[t(:label_operation_fail)]
    end

    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_data
    columnId=params[:columnId]
    column_list= Dip::TemplateValidation.where(:template_column_id => columnId)
    columns, count = paginate(column_list)
    respond_to do |format|
      format.html {
        @count = count
        @datas = columns
      }
    end
  end
end
