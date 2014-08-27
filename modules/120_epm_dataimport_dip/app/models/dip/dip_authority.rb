class Dip::DipAuthority < ActiveRecord::Base
  set_table_name :dip_dip_authorities
  query_extend
  @@mutex=Mutex.new
  def self.mutex
    @@mutex
  end

  def self.get_all_parent(id, type)
    targets=[id]
    if type==Dip::DipConstant::AUTHORITY_PERSON
      orgId= Irm::Person.find(id).organization_id
      if orgId
        targets=targets+get_all_parent(orgId, Dip::DipConstant::AUTHORITY_GROUP)
      end
    elsif type== Dip::DipConstant::AUTHORITY_GROUP
      begin
        parentId= Irm::Organization.find(id).parent_org_id
      rescue
        parentId=nil
      end
      if parentId
        targets=targets+get_all_parent(parentId, Dip::DipConstant::AUTHORITY_GROUP)
      end
    end
    targets
  end

  def self.get_all_authorized_data(id, type, function_type)
    targets=get_all_parent(id, type)
    targets_str=targets.collect { |t| "'"+t+"'" }.join(",")
    sql="select t.* from dip_dip_authorities t where t.function_type='#{function_type}' and t.target in (#{targets_str}) "
    Dip::DipAuthority.find_by_sql(sql)
  end

  def self.get_all_authorized_value_data(id, type, function_type, headerId)
    targets=get_all_parent(id, type)
    targets_str=targets.collect { |t| "'"+t+"'" }.join(",")
    sql="select t.* from dip_dip_authorities t ,dip_header_value v where t.function=v.id and v.header_id='#{headerId}' and t.function_type='#{function_type}' and t.target in (#{targets_str}) "
    Dip::DipAuthority.find_by_sql(sql)
  end

  def self.get_all_authorized_data_paged(id, type, function_type, start, limit)
    targets=get_all_parent(id, type)
    targets_str=targets.collect { |t| "'"+t+"'" }.join(",")
    sql="select t.* from dip_dip_authorities t where t.function_type='#{function_type}' and t.target in (#{targets_str}) order by t.target_type desc"
    datas=Dip::DipAuthority.find_by_sql(Dip::Utils.paginate(sql, start, limit))
    count=Dip::Utils.get_count(sql);
    return datas, count
  end

  def self.get_all_authorized_value_data_paged(id, type, function_type, headerId, start, limit)
    targets=get_all_parent(id, type)
    targets_str=targets.collect { |t| "'"+t+"'" }.join(",")
    sql="select t.* from dip_dip_authorities t ,dip_header_value v where t.function=v.id and v.header_id='#{headerId}' and t.function_type='#{function_type}' and t.target in (#{targets_str}) order by t.target_type desc"
    datas=Dip::DipAuthority.find_by_sql(Dip::Utils.paginate(sql, start, limit))
    count=Dip::Utils.get_count(sql)
    return datas, count
  end

  def self.authorized?(target, function)
    flag=false
    targets= get_all_parent(target, Dip::DipConstant::AUTHORITY_PERSON)
    targets_str=targets.collect { |t| "'"+t+"'" }.join(",")
    sql="select * from dip_dip_authorities t where t.target in (#{targets_str}) and t.function='#{function}'"
    unless Dip::DipAuthority.find_by_sql(sql).empty?
      flag=true
    end
    flag
  end

end
