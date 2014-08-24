class Dip::TemplateColumnController < ApplicationController
  layout "bootstrap_application_full"

  def new
    respond_to do |format|
      format.html
    end
  end

  def edit
    column=Dip::TemplateColumn.find(params[:id])
    respond_to do |format|
      format.json { render :json => column.to_json }
    end
  end

  def get_data
    template_id=params[:template_id]
    column_data=Dip::TemplateColumn.where(:template_id => template_id).order(:index_id)
    #columns, count = paginate(column_data)
    respond_to do |format|
      format.html {
        @count = column_data.count
        @datas = column_data
      }
    end
  end

  def destroy
    result={:success => true}
    begin
      columnIds=params[:columnIds]
      columnIds.each do |column|
        Dip::TemplateColumn.find(column).destroy
      end
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

  def create
    result={:success => true}
    last=Dip::TemplateColumn.where(:template_id => params[:template_id]).order("index_id").last
    index=1
    if (last)
      index=last[:index_id]+1
    end
    pams={:name => params[:name], :is_pk => params[:is_pk].nil? ? false : true,
          :omitted => params[:omitted].nil? ? false : true,
          :mapped => params[:mapped].nil? ? false : true,
          :editable => params[:editable].nil? ? false : true,
          :data_type => params[:data_type],
          :template_id => params[:template_id],
          :column_name => params[:column_name],
          :editable => params[:value_list],
          :index_id => index,
          :view_column => params[:view_column],
          :column_length => params[:column_length]}
    column=Dip::TemplateColumn.new(pams)
    if (column.save)
      column.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for column
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def update
    result={:success => true}
    pams={}
    pams[:name]=params[:name]
    pams[:column_name]=params[:column_name]
    pams[:is_pk]= params[:is_pk] ? true : false
    pams[:omitted]= params[:omitted] ? true : false
    pams[:mapped]= params[:mapped] ? true : false
    pams[:editable] = params[:editable].nil? ? false : true
    pams[:data_type]=params[:data_type]
    pams[:value_list]=params[:value_list]
    pams[:view_column]=params[:view_column]
    pams[:column_length]=params[:column_length]
    column=Dip::TemplateColumn.find(params[:id])
    if column.update_attributes(pams)
      column.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for column
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def reorder
    result={:success => true}
    begin
      ordered_ids=params[:ordered_ids]
      i=1
      ActiveRecord::Base.transaction do
        ordered_ids.split(",").each do |id|
          Dip::TemplateColumn.find(id).update_attributes({:index_id => i})
          i=i+1
        end
      end
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

end
