module Dip::TemplateHelper
  def get_username(id)
    (user=Irm::Person.where(:id => id).first).nil? ? "" : user.login_name
  end

  def getInitList(headerId,templateId)
    res=[]
    authorized_value=Dip::DipAuthority.get_all_authorized_value_data(Irm::Person.current.id, Dip::DipConstant::AUTHORITY_PERSON,
                                                                     Dip::DipConstant::AUTHORITY_VALUE, headerId).collect { |v| "'"+v.function+"'" }.join(",")
    if !authorized_value.nil? && authorized_value.size > 0
	  template=Dip::Template.find(params[:id])
	  combination=template.combination_id
	  sql="select distinct DIP#{headerId.to_s.upcase} from DIP#{combination.to_s.upcase}_VIEW where enabled=1 and DIP#{headerId.to_s.upcase} in (#{authorized_value})"
	  authorized_value=Dip::CommonModel.find_by_sql(sql).collect{|v|"'"+v["dip#{headerId.to_s.downcase}"]+"'"}.join(",")
	  headerValues=[]
	  if !authorized_value.nil? && authorized_value.size > 0
		headerValues=Dip::HeaderValue.find_by_sql("select distinct t.* from dip_header_value t where t.\"ENABLED\"=1 and t.id in (#{authorized_value}) order by t.code")
	  end
      unless headerValues.empty?
        res = headerValues.collect { |v| [v.value, v.id] }
      end
    end
    return res
  end

  def getInitValueList(headerId)
    res=[]
    authorized_value=Dip::DipAuthority.get_all_authorized_value_data(Irm::Person.current.id, Dip::DipConstant::AUTHORITY_PERSON,
                                                                     Dip::DipConstant::AUTHORITY_VALUE, headerId).collect { |v| "'"+v.function+"'" }.join(",")
    if !authorized_value.nil? && authorized_value.size > 0
      headerValues=Dip::HeaderValue.find_by_sql("select distinct t.* from dip_header_value t where t.id in (#{authorized_value}) order by t.code")
      unless headerValues.empty?
        res = headerValues.collect { |v| [v.value, v.id] }
      end
    end
    return res
  end

  def get_column_value(data, templateId, column)
    program=column[:value_source]
    columns=Dip::TemplateColumn.where({:template_id => templateId, :is_pk => true}).order("index_id")
    sql="plsql."+program+"("
    sql << ":combination_record=>'#{data[:combination_record]}'"
    columns.each do |c|
      sql << ",:#{c.column_name.to_s.downcase}=>'#{data[column.column_name.to_s.downcase]}'"
    end
    sql << ") do |res| data=res[:cur].fetch_all  end"
    data=[]
    eval(sql)
    datas=[]
    data.each do |d|
      datas << [d[1], d[0]]
    end
    return datas
  end

  def column_editable(column)
    if column[:editable]
      return true
    end
    false
  end

  def column_visible(column)
    if ["combination_record", "row_id", "id"].include?(column.column_name.to_s.downcase)
      return false
    end
    true
  end

  def column_format(column_name, value)
    if value==0
      return '0'
    end
    if ["created_by", "updated_by"].include?(column_name)
      return (person=Irm::Person.where(:id => value).first) ? person.login_name : ""
    end
    if value.nil?
      return ""
    elsif value.instance_of?(BigDecimal)
      return value.round(6).to_s('F').gsub(/\.?0*$/, "")
    elsif value.instance_of?(Float)
      return value.round(6).to_s.gsub(/\.?0*$/, "")
    elsif value.instance_of?(Time) || value.instance_of?(ActiveSupport::TimeWithZone)
      return value.strftime("%Y-%m-%d %H:%M:%S")
    else
      return value.to_s
    end
  end
end
