class Dip::TemplateViewColumnController < ApplicationController
  layout "bootstrap_application_full"

  def get_data
    template=Dip::Template.find(params[:template_id])
    if (template)
      viewColumns=Dip::TemplateViewColumn.where(:template_id => params[:template_id]).order(:index_id)
      #columns, count=paginate(viewColumns)
      respond_to do |format|
        format.html {
          @datas=viewColumns
          @count=viewColumns.count
        }
      end
    else
      respond_to do |format|
        format.html {
          @datas={}
          @count=0
        }
      end
    end
  end

  def reorder
    result={:success => true}
    begin
      ordered_ids=params[:ordered_ids]
      i=1
      ActiveRecord::Base.transaction do
        ordered_ids.split(",").each do |id|
          Dip::TemplateViewColumn.find(id).update_attributes({:index_id => i})
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

  def update
    column=Dip::TemplateViewColumn.find(params[:id])
    if (column)
      column.update_attributes({:name => params[:name], :column_name => params[:column_name],
                                :value_list => params[:value_list],
                                :editable => params[:editable] ? true : false
                               })
    end
    respond_to do |format|
      format.json {
        render :json => {}.to_json
      }
    end
  end

  def edit
    respond_to do |format|
      format.json {
        render :json => Dip::TemplateViewColumn.find(params[:id]).to_json
      }
    end
  end

  def destroy
    result={:success => true}
    begin
      columnIds=params[:columnIds]
      columnIds.each do |column|
        Dip::TemplateViewColumn.find(column).destroy
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
    last=Dip::TemplateViewColumn.where(:template_id => params[:template_id]).order("index_id").last
    index=1
    if (last)
      index=last[:index_id]+1
    end
    pams={:name => params[:name], :template_id => params[:template_id],
          :column_name => params[:column_name], :index_id => index,
          :value_list => params[:value_list],
          :editable => params[:editable] ? true : false,
    }
    column=Dip::TemplateViewColumn.new(pams)
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

end
