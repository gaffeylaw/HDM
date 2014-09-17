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
    combination=Dip::Combination.where({:id => params[:combinationId]}).first
    if (combination)
      headerValueIds=params[:headerValueIds]
      start=params[:start].to_i
      limit=params[:limit].to_i
      sql_select="select v.combination_record \"id\",v.enabled,r.updated_by,r.updated_at"
      sql_from=" from \"#{combination[:code].to_s.upcase}\" v,dip_combination_records r"
      sql_where=" where r.combination_id='#{params[:combinationId]}' and r.id=v.combination_record"
      sql_order=" order by r.updated_at desc"
      Dip::CombinationHeader.find_by_sql("select t1.COMBINATION_ID,t1.HEADER_ID,t2.CODE,t2.\"NAME\" from DIP_COMBINATION_HEADERS t1,DIP_HEADER t2 where t1.HEADER_ID=t2.\"ID\" and t1.COMBINATION_ID='#{combination[:id]}'").each do |h|
        sql_select << ",v.#{h[:code].to_s.upcase}_V"
        sql_order << ",v.#{h[:code].to_s.upcase}_V"
      end
      if headerValueIds
        Dip::CommonModel.find_by_sql("SELECT t2.CODE,t1.\"ID\" FROM DIP_HEADER_VALUE t1,DIP_HEADER t2 WHERE t1.HEADER_ID = t2.\"ID\" and t1.\"ID\" in (#{headerValueIds.collect { |x| "'#{x}'" }.join(",")})").each do |data|
          sql_where << " and v.\"#{data[:code].to_s.upcase}\"='#{data[:id]}'"
        end
      end
      sql=sql_select+sql_from+sql_where+sql_order
      p sql
      data = Dip::CombinationRecord.find_by_sql(Dip::Utils.paginate(sql, start, limit))
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
    code=params[:code]
    combination_new=Dip::Combination.new({:name => name, :code => code})
    if (combination_new.save)
      begin
        headerIds.each do |h|
          Dip::CombinationHeader.new({:combination_id => combination_new[:id], :header_id => h}).save
        end
        generateView(combination_new[:id])
        Dip::HeaderValue.where({:header_id=>headerIds[0],:enabled=>true}).each do |v|
          Dip::Combination.enable_new_value(v[:id],true)
        end
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
    headers=Dip::CombinationHeader.find_by_sql("select t1.COMBINATION_ID,t1.HEADER_ID,t2.CODE,t2.\"NAME\" from DIP_COMBINATION_HEADERS t1,DIP_HEADER t2 where t1.HEADER_ID=t2.\"ID\" and t1.COMBINATION_ID='#{combination[:id]}'")
    sql="create or replace view #{combination[:code].to_s.upcase} as "
    sql_select=" select r.id \"COMBINATION_RECORD\",r.enabled"
    sql_from=" from dip_combination_records r"
    sql_where=" where r.combination_id='#{id}'"
    (1..headers.size).each do |i|
      sql_select << ",i#{i}.header_value_id \"#{(headers[i-1])[:code].to_s.upcase}\""
      sql_select << ",v#{i}.\"VALUE\" \"#{(headers[i-1])[:code].to_s.upcase}_V\""
      sql_from << ",dip_combination_items i#{i},dip_header_value v#{i}"
      sql_where << " and i#{i}.combination_record_id=r.id  and i#{i}.header_value_id=v#{i}.id and v#{i}.header_id='#{headers[i-1][:header_id]}' "
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
