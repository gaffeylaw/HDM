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
            id=Dip::HeaderValue.where(:header_id => v["header_id"], :value => v["value"], :code => v["code"]).first.id
            enable_new_value(id)
            headerValue.errors.add("success_msg_only", t(:label_operation_success));
          rescue => ex
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

  def enable
    result={:success => true}
    begin
      valueIds=params[:valueIds]
      valueIds.each do |v|
        headerValue=Dip::HeaderValue.find(v)
        ActiveRecord::Base.transaction do
          Dip::Combination.enable_new_value(v,false)
        end
      end
      result[:msg]=[t(:label_operation_success)]
    rescue =>ex
      result[:success] = false
      result[:msg]=[t(:label_operation_fail)]
      logger.error ex
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
        value_str=valueIds.collect { |x| "'#{x}'" }.join(",")
        ActiveRecord::Base.transaction do
          ActiveRecord::Base.connection.execute("update dip_header_value t set t.enabled=0 where t.id in(#{value_str})")
          ActiveRecord::Base.connection.execute(%{UPDATE DIP_COMBINATION_RECORDS t2
              SET t2.ENABLED = 3
              WHERE
                EXISTS (
                  SELECT
                    1
                  FROM
                    DIP_COMBINATION_ITEMS t1
                  WHERE
                    t1.HEADER_VALUE_ID in (#{value_str})
                  AND t1.COMBINATION_RECORD_ID = t2."ID"
                )})
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

  def sync_value
    error_flag=false
    Dip::Header.where("1=1").each do |h|
      Dip::CommonModel.find_by_sql("select * from dip_values t where t.value_set_code='#{h[:code]}'").each do |v|
        value= Dip::HeaderValue.where({:header_id => h[:id], :code => v[:value_code]}).first
        unless value
          begin
            Dip::HeaderValue.new({:header_id => h[:id],
                                  :code => v[:value_code],
                                  :value => v[:value],
                                  :enabled => 0}).save
          rescue => ex
            error_flag=true
            logger.error(ex)
          end
        end
      end
    end
    respond_to do |format|
      format.json {
        render :json => error_flag ? (t(:label_sync_org_with_error).to_json) : (t(:label_sync_org_success).to_json)
      }
    end
  end
end
