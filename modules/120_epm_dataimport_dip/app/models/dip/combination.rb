class Dip::Combination < ActiveRecord::Base
  set_table_name :dip_combination
  query_extend
  has_many :combination_header, :dependent => :destroy
  has_many :combination_record, :dependent => :destroy
  validates_presence_of :name
  validates_uniqueness_of :name

  def self.enable_new_value(v,is_create)
  headerValue=Dip::HeaderValue.find(v)
  if ((!is_create)&&headerValue.enabled)
    return
  end
  ActiveRecord::Base.transaction do
    headerValue.update_attributes({:enabled => true})
    combinations=Dip::CombinationHeader.find_by_sql("select t1.*,t2.CODE from DIP_COMBINATION_HEADERS t1,DIP_COMBINATION t2 where t1.COMBINATION_ID=t2.\"ID\" and t1.header_id='#{headerValue[:header_id]}'")
    connection=ActiveRecord::Base.connection.raw_connection
    connection.autocommit=false
    combinations.each do |c|
      sql=%{select t3.HEADER_ID from
                                          (SELECT t1.HEADER_ID from DIP_COMBINATION_HEADERS t1 where t1.COMBINATION_ID='#{c[:combination_id]}' and t1.header_id<>'#{headerValue[:header_id]}') t3 left join
                                          (select DISTINCT t2.HEADER_ID from DIP_HEADER_VALUE t2 where t2.ENABLED=1) t4
                                          on t3.header_id=t4.header_id
                                          where t4.header_id is null}
      if Dip::CommonModel.find_by_sql(sql).size >0
        next
      end
      headers=Dip::CombinationHeader.find_by_sql(%{
        select t.*,t1.code from DIP_COMBINATION_HEADERS t,DIP_HEADER t1 where t.COMBINATION_ID='#{c[:combination_id]}'
        and t.HEADER_ID <> '#{headerValue[:header_id]}' and t.header_id=t1.id})
      sql_select="select '#{headerValue[:id]}' \"H#{headerValue[:header_id].to_s.upcase}\""
      sql_from=" from "
      headers.each_with_index do |header,i|
        sql_select << ",t#{i+1}.\"ID\" \"H#{header[:header_id].to_s.upcase}\""
        if sql_from==" from "
        else
          sql_from << ","
        end
        sql_from << "(select t.\"ID\" from DIP_HEADER_VALUE t where t.enabled=1 and t.HEADER_ID='#{header[:header_id]}') t#{i+1}"
      end
      sql=sql_select+sql_from
      res=ActiveRecord::Base.connection.execute(sql)
      r_count=1
      while(record=res.fetch_hash)
        key_str=(record.values.collect { |x| x.to_s }).sort.join("-")
        sql0="select 1 from DIP_COMBINATION_RECORDS t where t.combination_key='#{key_str}' and t.combination_id='#{c[:combination_id]}'"
        if Dip::CommonModel.find_by_sql(sql0).first
          next
        end
        record_id=Random.new().rand(999999999999).to_s+Time.now.to_i.to_s
        sql02="insert into DIP_COMBINATION_RECORDS(id,combination_id,combination_key,enabled,created_by,updated_by,created_at,updated_at) values('#{record_id}','#{c[:combination_id]}','#{key_str}',0,'#{Irm::Person.current.id}','#{Irm::Person.current.id}',sysdate,sysdate)"
        connection.exec(sql02)
        headers.each do |h0|
          item_id=Random.new().rand(999999999999).to_s+Time.now.to_i.to_s
          connection.exec("insert into DIP_COMBINATION_ITEMS(id,combination_record_id,header_value_id,created_by,updated_by,created_at,updated_at) values('#{item_id}','#{record_id}','#{record["H#{h0[:header_id].to_s.upcase}"]}','#{Irm::Person.current.id}','#{Irm::Person.current.id}',sysdate,sysdate)")
        end
        connection.exec("insert into DIP_COMBINATION_ITEMS(id,combination_record_id,header_value_id,created_by,updated_by,created_at,updated_at) values('#{Random.new().rand(999999999999).to_s+Time.now.to_i.to_s}','#{record_id}','#{headerValue[:id]}','#{Irm::Person.current.id}','#{Irm::Person.current.id}',sysdate,sysdate)")
        r_count+=1
        if r_count%1000==0
          connection.commit
        end
      end
      connection.commit
      res.close
    end
  end
  end
end
