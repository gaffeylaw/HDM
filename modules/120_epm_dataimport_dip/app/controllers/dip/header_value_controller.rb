class Dip::HeaderValueController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def create
    result={:success => true}
    result[:msg]=[]
    params[:values].each do |value|
      v=value[1]
      headerValue=Dip::HeaderValue.new({:header_id => v["header_id"], :value => v["value"], :code => v["code"], :enabled => false})
      if (headerValue.save)
        if ("true"==v["enabled"])
          begin
            id=[Dip::HeaderValue.where(:header_id => v["header_id"], :value => v["value"], :code => v["code"]).first.id]
            enable_new_value(id)
            headerValue.errors.add("success_msg_only", t(:label_operation_success));
          rescue  => ex
            logger.error ex
            headerValue.errors.add("fail_msg_only", t(:label_operation_fail));
          end
        else
          headerValue.errors.add("success_msg_only", t(:label_operation_success));
        end
      else
        logger.error headerValue.errors
        result[:success]=false
      end
      result[:msg] << "[#{v["value"]}] "+Dip::Utils.error_message_for(headerValue).to_s
    end

    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end


  def update
    result={:success => true}
    dip_header_value = Dip::HeaderValue.find(params[:id])
    if dip_header_value.update_attributes({:value => params[:value], :code => params[:code]})
      dip_header_value.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success] = false
    end
    result[:msg] =Dip::Utils.error_message_for dip_header_value
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def destroy

  end


  def get_data
    order_name=params[:order_name]
    order_value=params[:order_value]
    order="code"
    if (order_name)
      order=order_name +" "+order_value
    end
    headerId=params[:header_id]
    dip_header_values_scope = Dip::HeaderValue.where(:header_id => headerId).order("#{order}")
    dip_header_values_scope = dip_header_values_scope.match_value("value", params[:value])
    dip_header_values_scope = dip_header_values_scope.match_value("code", params[:code])
    data, count = paginate(dip_header_values_scope)
    respond_to do |format|
      format.html {
        @datas = data
        @count = count
      }
    end
  end

  def enable_new_value(valueIds)
    if (!valueIds.nil?&&valueIds.any?)
      valueIds.each do |v|
        headerValue=Dip::HeaderValue.find(v)
        if (!headerValue.nil?&&headerValue.enabled==false)
          ActiveRecord::Base.transaction do
            temp=headerValue.update_attributes({:enabled => true})
            combinations=Dip::CombinationHeader.where(:header_id => headerValue.header_id)
            if (combinations.any?)
              combinations.each do |c|
                headers=Dip::CombinationHeader.where(:combination_id => c.combination_id)
                list={}
                headers.each do |header|
                  vals=Dip::HeaderValue.select("id").where(:header_id => header.header_id).collect { |v| v.id }
                  list["#{header.header_id}"]=vals
                end
                list["#{headerValue.header_id}"]=["#{headerValue.id}"]
                record_size=1
                list.values.each do |v|
                  record_size=record_size*v.size
                end
                if record_size>0
                  con=  Dip::Combination.new
                  con.generate_combination_records(c.combination_id, headers.size, [], list.values, 0, 0)
                  con.saveData
                end
              end
            end
          end
        end
      end
    end
  end

  def enable
    result={:success => true}
    begin
      valueIds=params[:valueIds]
      valueIds.each do |v|
        headerValue=Dip::HeaderValue.find(v)
        if (!headerValue.nil?&&headerValue.enabled==false)
          if(Dip::CombinationItem.where(:header_value_id=>v).count>0)
            ActiveRecord::Base.transaction do
              headerValue.update_attributes({:enabled => true})
            end
          else
            enable_new_value([v])
          end
        end
      end
      result[:msg]=[t(:label_operation_success)]
    rescue
      result[:success] = false
      result[:msg]=[t(:label_operation_fail)]
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def disable
    result={:success => true}
    begin
      valueIds=params[:valueIds]
      headerId=nil
      if (!valueIds.nil?&&valueIds.any?)
        valueIds.each do |v|
          ActiveRecord::Base.transaction do
            headerValue=Dip::HeaderValue.find(v)
            headerId=headerValue.header_id
            if (!headerValue.nil?&&headerValue.enabled==true)
              headerValue.update_attributes({:enabled => false})
              disable_value_related(headerValue.id)
            end
          end
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

  def disable_value_related(id)
    items=Dip::CombinationItem.where(:header_value_id => id)
    items.each do |item|
      if (Dip::CombinationRecord.find(item.combination_record_id))
        rec=Dip::CombinationRecord.find(item.combination_record_id)
        rec.update_attributes({:enabled => false})
      end
    end
  end
end
