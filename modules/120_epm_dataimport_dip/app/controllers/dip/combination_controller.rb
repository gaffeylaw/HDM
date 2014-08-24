class Dip::CombinationController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  #TODO
  def get_data
    data=[]
    count=0
    if (params[:combinationId]&&params[:combinationId].to_s.size>0&&params[:combinationId]!="null")
      headerValueIds=params[:headerValueIds]
      start=params[:start].to_i
      limit=params[:limit].to_i
      sql_select="select v.combination_record \"id\",v.enabled,r.updated_by,r.updated_at"
      sql_from=" from dip_combination c,DIP#{params[:combinationId]}_VIEW v,dip_combination_records r"
      sql_where=" where c.id = '#{params[:combinationId]}' and r.combination_id=c.id and r.id=v.combination_record"
      sql_order=" order by r.updated_at desc"
      values={}
      if (headerValueIds)
        headerValueIds.each do |v|
          header_value=Dip::HeaderValue.find(v)
          values[header_value.header_id]=v
        end
      end
      i=1
      Dip::CombinationHeader.where(:combination_id => params[:combinationId]).order("header_id").each do |h|
        sql_select << ",v#{i}.value \"DIP#{h.header_id.to_s.upcase}\""
        sql_from << ",dip_header_value v#{i}"
        sql_where << " and v.DIP#{h.header_id.to_s.upcase}=v#{i}.id and v#{i}.enabled=1"
        sql_order << ",v#{i}.value"
        if values[h.header_id]
          sql_where << " and v.DIP#{h.header_id.to_s.upcase}='#{values[h.header_id]}'"
        end
        i+=1
      end
      sql=sql_select+sql_from+sql_where+sql_order
      data = Dip::CombinationRecord.find_by_sql(Dip::Utils.paginate(sql,start,limit))
      count=Dip::Utils.get_count(sql)
    end
    respond_to do |format|
      format.html {
        @datas = data
        @count = count
        @combinationId=params[:combinationId]
      }
    end
  end

  def create
    result={:success => true}
    headerIds=params[:headerIds]
    name=params[:name]
    combination_new=Dip::Combination.new({:name => name})
    if (combination_new.save)
      begin
        list={}
        headerIds.each do |h|
          Dip::CombinationHeader.new({:combination_id => combination_new[:id], :header_id => h}).save
          headerVals=Dip::HeaderValue.select("id").where(:header_id => h).collect { |c| c.id }
          list["#{h}"]=headerVals
        end
        record_size=1
        list.values.each do |v|
          record_size=record_size*v.size
        end
        if record_size>0
          con=Dip::Combination.new
          con.generate_combination_records(combination_new[:id], headerIds.size, [], list.values, 0, 0)
          con.saveData
        end
        generateView(combination_new[:id])
        result[:msg]=[t(:label_operation_success)]
      rescue => ex
        logger.error ex
        result[:success]=false
        result[:msg]=[t(:label_operation_fail)]
      end
    else
      result[:success]=false
      result[:msg]=Dip::Utils.error_message_for(combination_new)
    end
    respond_to do |format|
      format.json {
        result[:selected]=combination_new[:id]
        result[:list]= Dip::Combination.order(:name)
        render :json => result.to_json
      }
    end
  end

  def destroy
    result={:success => true}
    begin
      combinationIds=params[:combinationIds]
      combinationIds.each do |id|
        rec=Dip::CombinationRecord.find(id)
        ActiveRecord::Base.transaction do
          if (rec)
            rec.destroy
            items=Dip::CombinationItem.where(:combination_record_id => rec.id)
            if items.any?
              items.each do |i|
                i.destroy
              end
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

  def updateData(ids)
    connection=ActiveRecord::Base.connection.raw_connection
    connection.autocommit=false
    ids.each do |column|
      #column.save
      connection.exec(column)
    end
    connection.commit
  end
  def enable
    result={:success => true}
    ids = []
    begin
      #logger.error  'Start: '+  Time.now.to_s
      combinationIds=params[:combinationIds]
      combinationIds.each do |id|
        update_sql = "update dip_combination_records t set t.enabled = 1,t.updated_by = '#{Irm::Person.current.id}',t.updated_at =sysdate where t.id = '#{id}'"
        ids << update_sql
      end
      updateData(ids)
      #logger.error 'End: '+ Time.now.to_s
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

  def in_process
    result={:success => true}
    ids = []
    begin
      combinationIds=params[:combinationIds]
      combinationIds.each do |id|
        update_sql = "update dip_combination_records t set t.enabled = 2,t.updated_by = '#{Irm::Person.current.id}',t.updated_at =sysdate where t.id = '#{id}'"
        ids << update_sql
      end
      updateData(ids)
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

  def close
    result={:success => true}
    ids = []
    begin
      combinationIds=params[:combinationIds]
      combinationIds.each do |id|
        update_sql = "update dip_combination_records t set t.enabled = 3,t.updated_by = '#{Irm::Person.current.id}',t.updated_at =sysdate where t.id = '#{id}'"
        ids << update_sql
      end
      updateData(ids)
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

  def rename
    result={:success => true}
    combinationId=params[:combinationId]
    value=params[:value]
    combination= Dip::Combination.find(combinationId)
    if (combination)
      if combination.update_attributes({:name => value})
        combination.errors.add("success_msg_only", t(:label_operation_success))
      else
        result[:success]=false
        combination.errors.add("fail_msg_only", t(:label_operation_fail))
      end
    end
    result[:msg]=Dip::Utils.error_message_for combination
    respond_to do |format|
      result[:selected]= combinationId
      result[:list]=Dip::Combination.order(:name)
      format.json {
        render :json => result.to_json
      }
    end
  end

  def delete
    result={:success => true}
    begin
      combinationId=params[:combinationId]
      combination=Dip::Combination.find(combinationId)
      if (combination)
        ActiveRecord::Base.transaction do
          combination.destroy
          ActiveRecord::Base.connection().execute("drop view DIP#{combinationId.to_s.upcase}_VIEW")
        end
        templates=Dip::Template.where(:combination_id => combinationId)
        templates.each do |t|
          t.update_attributes({:combination_id => nil})
        end
      end
      result[:msg]=[t(:label_operation_success)]
    rescue
      result[:success]=false
      result[:msg]=[t(:label_operation_fail)]
    end
    respond_to do |format|
      result[:list]=Dip::Combination.order(:name)
      format.json {
        render :json => result.to_json
      }
    end
  end

  def generateView(id)
    combination=Dip::Combination.find(id)
    headers=Dip::CombinationHeader.where(:combination_id => combination.id).collect { |h| h.header_id }
    sql="create or replace view DIP#{id.to_s.upcase}_VIEW as "
    sql_select=" select r.id \"COMBINATION_RECORD\",r.enabled"
    sql_from=" from dip_combination_records r"
    sql_where=" where r.combination_id='#{id}'"
    (1..headers.size).each do |i|
      sql_select << ",i#{i}.header_value_id \"DIP#{headers[i-1].to_s.upcase}\""
      sql_from << ",dip_combination_items i#{i},dip_header_value v#{i}"
      sql_where << " and i#{i}.combination_record_id=r.id  and i#{i}.header_value_id=v#{i}.id and v#{i}.header_id='#{headers[i-1]}' "
    end
    sql << sql_select
    sql << sql_from
    sql << sql_where
    ActiveRecord::Base.connection().execute(sql)

  end

  def getHeaderList
    combinationId=params[:combinationId]
    header_list=Dip::CombinationHeader.select("header_id").where(:combination_id => combinationId).collect { |h| h.header_id }
    respond_to do |format|
      format.json {
        render :json => header_list.to_json
      }
    end
  end

end
