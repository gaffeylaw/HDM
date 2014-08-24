class Dip::HeaderController < ApplicationController
  layout "bootstrap_application_full"

  def create
    result={:success => true}
    newHeader=Dip::Header.new({:name => params[:name], :code => params[:code]})
    if (newHeader.save)
      newHeaderId= Dip::Header.where(:code => params[:code]).first.id
      headers=Dip::Header.order(:id)
      newHeader.errors.add("success_msg_only", t(:label_operation_success))
      result[:selected]= newHeaderId
      result[:list]=headers
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for(newHeader)
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def update
    result={:success => true}
    header=Dip::Header.find(params[:id])
    if (header)
      if (header.update_attributes({:name => params[:name], :code => params[:code]}))
        newHeaderId= params[:id]
        headers=Dip::Header.order(:id)
        result[:selected]=newHeaderId
        result[:list]=headers
        header.errors.add("success_msg_only", t(:label_operation_success))
      else
        result[:success]=false
      end
    else
      result[:success]=false
      header.errors.add("fail_msg_only", t(:label_operation_fail))
    end
    result[:msg]=Dip::Utils.error_message_for(header)
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_data
    order_name=params[:order_name]
    order_value=params[:order_value]
    order="id"
    if (order_name)
      order=order_name +" "+order_value
    end
    headers=Dip::Header.order(order)
    data, count=paginate(headers)
    respond_to do |format|
      format.html {
        @datas=data
        @count=count
      }
    end
  end

  def destroy

  end

  def get_header
    respond_to do |format|
      format.json{
        render :json=>Dip::Header.where(:id=>params[:id]).first.to_json
      }
    end
  end
end
