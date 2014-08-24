class Dip::Utils
  def self.error_message_for(*args)
    error_count = 0
    full_messages = []
    args.each do |instance|
      if instance.errors&&instance.errors.any?
        instance.errors.each do |attr, msg|
          if attr.to_s.ends_with?("msg_only")
            full_messages << msg.to_s
          else
            full_messages << t(("label_#{instance.class.name.underscore.gsub(/\//, "_")}_" + attr.to_s.gsub(/\_id$/, "")).to_sym)+" #{msg}"
          end
        end
        error_count+=instance.errors.count
      end
    end
    return full_messages
  end

  def self.t(key)
    I18n.t(key)
  end

  def self.paginate(sql, start, limit)
    p_sql="select * from (select raw_sql_.*, rownum raw_rnum_ from ("
    p_sql << sql
    p_sql << ") raw_sql_ where rownum <=#{start.to_i+limit.to_i}) where raw_rnum_ >#{start}"
    return p_sql
  end

  def self.get_count(sql)
    return (ActiveRecord::Base.connection.execute("select count(*) from (#{sql})").fetch)[0]
  end

  def self.filter_sql(str)
    return str.gsub(/('|;|-{2,})/, " ")
  end

  def self.get_type(data)
    types=[]
    data.each do |d|
      types << :string
    end
    return types
  end
end
