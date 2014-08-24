class Dip::ValidationController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def get_data
    validations = Dip::Validation.order("name")
    validations=validations.match_value("#{Dip::Validation.table_name}.name", params[:name])
    validations=validations.match_value("#{Dip::Validation.table_name}.description", params[:description])
    validations=validations.match_value("#{Dip::Validation.table_name}.program", params[:program])
    dip_validation, count = paginate(validations)
    respond_to do |format|
      format.html {
        @count = count
        @datas = dip_validation
      }
    end
  end

  def edit
    @validation=Dip::Validation.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def destroy
    validation=Dip::Validation.find(params[:id])
    if !validation.nil?
      validation.destroy
      template_validations=Dip::TemplateValidation.where(:validation_id => params[:id])
      if (template_validations.any?)
        template_validations.each do |v|
          v.destroy
        end
      end
    end
    respond_to do |format|
      format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
    end
  end

  def new
    @validation=Dip::Validation.new
    respond_to do |format|
      format.html
    end
  end

  def create
    @validation=Dip::Validation.new(params[:dip_validation])
    respond_to do |format|
      if (@validation.save)
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    @validation=Dip::Validation.find(params[:id])
    respond_to do |format|
      if (@validation.update_attributes(params[:dip_validation]))
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
      else
        format.html { render :action => "edit", :id => params[:id] }
      end
    end
  end
end
