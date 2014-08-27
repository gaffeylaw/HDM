module Dip::TemplateHelper
  def get_username(id)
    (user=Irm::Person.where(:id => id).first).nil? ? "" : user.login_name
  end

  def getInitList(headerId,templateId)
    res=[]
    template=Dip::Template.where(:id=>templateId).first
		headerValues=Dip::HeaderValue.find_by_sql("SELECT DISTINCT"+
                                                 " t2. ID,"+
                                                 " t2.CODE,"+
                                                 " t2.\"VALUE\""+
                                               " FROM"+
                                                 " DIP_AUTHORITYXES t1,"+
                                                 " DIP_HEADER_VALUE t2,"+
                                                 " DIP_COMBINATION_RECORDS t3,"+
                                                 " DIP_COMBINATION_ITEMS t4"+
                                               " WHERE"+
                                                 " t1.FUNCTION_TYPE = 'VALUE'"+
                                               " AND t1.PERSON_ID = '#{Irm::Person.current.id}'"+
                                               " AND t1.\"FUNCTION\" = t2.\"ID\""+
                                               " AND t4.HEADER_VALUE_ID=t2.\"ID\""+
                                               " AND t3.COMBINATION_ID = '#{template[:combination_id]}'"+
                                               " AND t3.enabled = 1"+
                                               " AND t2.HEADER_ID = '#{headerId}'"+
                                               " AND t4.COMBINATION_RECORD_ID=T3.\"ID\" order by t2.code")
      unless headerValues.empty?
        res = headerValues.collect { |v| [v.value, v.id] }
      end
    return res
  end

  def getInitValueList(headerId)
    res=[]
    headerValues=Dip::HeaderValue.find_by_sql("SELECT DISTINCT"+
                                              "    t2. ID,"+
                                              "    t2.CODE,"+
                                              "    t2.\"VALUE\""+
                                              "  FROM"+
                                              "    DIP_AUTHORITYXES t1,"+
                                              "    DIP_HEADER_VALUE t2"+
                                              "  WHERE"+
                                              "    t1.FUNCTION_TYPE = 'VALUE'"+
                                              "  AND t1.PERSON_ID = '#{Irm::Person.current.id}'"+
                                              "  AND t1.\"FUNCTION\" = t2.\"ID\""+
                                              "  AND t2.HEADER_ID = '#{headerId}'"+
                                              "  order by t2.CODE")
    unless headerValues.empty?
      res = headerValues.collect { |v| [v.value, v.id] }
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
