class Irm::Report < ActiveRecord::Base
  set_table_name :irm_reports
  serialize :program_params, Hash

  attr_accessor :step,:report_columns_str,:current_history_id


  #多语言关系
  attr_accessor :name,:description
  has_many :reports_tls,:dependent => :destroy
  acts_as_multilingual


  belongs_to :report_type
  has_one :report_trigger,:dependent => :destroy

  has_many :report_group_columns,:order=>:seq_num,:dependent => :destroy
  accepts_nested_attributes_for :report_group_columns

  has_many :report_columns,:order=>:seq_num,:dependent => :destroy

  has_many :report_criterions,:order=>:seq_num,:dependent => :destroy,:conditions => "param_flag = '#{Irm::Constant::SYS_NO}'"
  accepts_nested_attributes_for :report_criterions

  has_many :param_criterions,:order=>:seq_num,:dependent => :destroy,:class_name => "Irm::ReportCriterion",:conditions => "param_flag = '#{Irm::Constant::SYS_YES}'"
  accepts_nested_attributes_for :param_criterions


  validates_presence_of :report_type_id, :if => Proc.new { |i| "CUSTOM".eql?(i.program_type)&&i.check_step(1) }
  validates_presence_of :code, :if => Proc.new { |i| i.check_step(2) }
  validates_uniqueness_of :code,:scope=>[:opu_id], :if => Proc.new { |i| i.code.present? }
  validates_format_of :code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| i.code.present?},:message=>:code
  validate :validate_raw_condition_clause,:if=> Proc.new{|i| "CUSTOM".eql?(i.program_type)&&i.raw_condition_clause.present?}

  before_save :set_condition,:if=> Proc.new{|i| "CUSTOM".eql?(i.program_type)}

  #加入activerecord的通用方法和scope
  query_extend
  # 对运维中心数据进行隔离
  default_scope {default_filter}

  # 同时查询报表类型
  scope :with_report_type,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::ReportType.view_name} ON #{Irm::ReportType.view_name}.id = #{table_name}.report_type_id  AND #{Irm::ReportType.view_name}.language = '#{language}'").
    select("#{Irm::ReportType.view_name}.name report_type_name")
  }
  # 查找报表文件夹
  scope :with_report_folder,lambda{|language|
    joins("JOIN #{Irm::ReportFolder.view_name} ON #{Irm::ReportFolder.view_name}.id = #{table_name}.report_folder_id  AND #{Irm::ReportFolder.view_name}.language = '#{language}' AND #{Irm::ReportFolder.view_name}.status_code = 'ENABLED'").
    select("#{Irm::ReportFolder.view_name}.name report_folder_name ,#{Irm::ReportFolder.view_name}.access_type,#{Irm::ReportFolder.view_name}.member_type")
  }
  # 查找当前用户能看到的报表
  scope :filter_by_folder_access,lambda{|person_id|
    where("(#{Irm::ReportFolder.view_name}.access_type != ?) OR (#{table_name}.created_by = ?)","FORBID",person_id)
  }
  # 按报表文件夹过滤
  scope :query_by_folders,lambda{|report_folder_ids|
    where("#{table_name}.report_folder_id IN (?)",report_folder_ids)
  }


  # 业务对像过滤
  scope :query_by_bo_name,lambda{|bo_model_name|
    joins("JOIN #{Irm::BusinessObject.table_name} ON #{Irm::BusinessObject.table_name}.id = #{Irm::ReportType.view_name}.business_object_id ").
    where("#{Irm::BusinessObject.table_name}.bo_model_name = ?",bo_model_name)
  }

  scope :with_report_trigger,lambda{
    joins("LEFT OUTER JOIN #{Irm::ReportTrigger.table_name} ON #{Irm::ReportTrigger.table_name}.report_id = #{table_name}.id").
    select("#{Irm::ReportTrigger.table_name}.id report_trigger_id")
  }

  def check_step(stp)
    self.step.nil?||self.step.to_i>=stp
  end


  def prepare_criterions
    unless self.report_criterions.size>4
      0.upto 4 do |index|
        self.report_criterions.build({:seq_num=>index+1})
      end
    end

    unless self.param_criterions.size>0
      0.upto 4 do |index|
        self.param_criterions.build({:seq_num=>index+1,:param_flag=>Irm::Constant::SYS_YES})
      end
    end
  end


  def prepare_group_column
    return if self.report_group_columns.size>3
    0.upto 3 do |index|
      self.report_group_columns.build({:seq_num=>index+1})
    end
  end

  #创建 更新报表列
  def create_columns_from_str
    return unless self.report_columns_str
    str_columns = self.report_columns_str.split(",").delete_if{|i| !i.present?}
    str_column_indexes = str_columns.dup
    exists_columns = Irm::ReportColumn.where(:report_id=>self.id)
    exists_columns.each do |column|
      if str_columns.include?(column.field_id)
        str_columns.delete(column.field_id)
        column.update_attribute(:seq_num,str_column_indexes.index(column.field_id)+1)
      else
        column.destroy
      end

    end

    str_columns.each do |column_str|
      next unless column_str.strip.present?
      self.report_columns.build(:field_id=>column_str,:seq_num=>str_column_indexes.index(column_str)+1)
    end if str_columns.any?
  end



  #同步自定义报表的报表参数
  def sync_custom_report_params
    self.program_params||={}
    self.param_criterions.each do |param_criterion|
      next unless param_criterion.field_id.present?&&param_criterion.filter_value.present?
      self.program_params.merge!({param_criterion.field_id=>param_criterion.filter_value})
    end
  end


  def report_column_array
    return @report_column_array if @report_column_array
    @report_column_array = self.report_columns.select_sequence.with_object_attribute.collect{|i| {:seq_num=>i[:seq_num],:business_object_id=>i[:business_object_id],:object_attribute_id=>i[:object_attribute_id],:object_attribute_category=>i[:object_attribute_category],:object_attribute_name=>i[:object_attribute_name],:report_type_field_id=>i[:report_type_field_id],:table_name=>self.report_type.table_name_hash[i[:business_object_id].to_s]}}
  end

  def report_group_column_array
    return @report_group_column_array if @report_group_column_array
    @report_group_column_array = self.report_group_columns.select_sequence.with_object_attribute.collect{|i| {:seq_num=>i[:seq_num],:business_object_id=>i[:business_object_id],:object_attribute_id=>i[:object_attribute_id],:object_attribute_category=>i[:object_attribute_category],:object_attribute_name=>i[:object_attribute_name],:table_name=>self.report_type.table_name_hash[i[:business_object_id].to_s],:group_date_type=>i.group_date_type}}
  end


  def report_type_column_array
    return @report_type_column_array if @report_type_column_array
    @report_type_column_array = Irm::ReportTypeField.select_all.query_by_report_type(self.report_type_id).with_bo_object_attribute(I18n.locale).collect{|i| {:field_id=>i[:id],:business_object_id=>i[:business_object_id],:object_attribute_id=>i[:object_attribute_id],:object_attribute_category=>i[:object_attribute_category],:object_attribute_name=>i[:attribute_name],:name=>i[:object_attribute_name],:table_name=>self.report_type.table_name_hash[i[:business_object_id].to_s]}}
  end




  #分组列数组
  def group_fields
    fields = self.report_group_column_array.collect{|i| i if i[:object_attribute_id].present?}.compact
    fields.collect{|i|
      column = self.report_type_column_array.detect{|e| e[:object_attribute_id].to_s.eql?(i[:object_attribute_id].to_s)}
      if ["LOOKUP_RELATION","MASTER_DETAIL_RELATION"].include?(i[:object_attribute_category])
        ["#{i[:table_name]}_#{i[:object_attribute_name]}_label",column[:name],i[:group_date_type]]
      else
        ["#{i[:table_name]}_#{i[:object_attribute_name]}",column[:name],i[:group_date_type]]
      end
    }
  end

  #矩阵显示列数组
  def matrix_field
    fields = self.report_group_column_array.collect{|i| i if i[:object_attribute_id].present?}
    matrix_column_header_field = fields[0..1].compact.collect{|i|
      column = self.report_type_column_array.detect{|e| e[:object_attribute_id].to_s.eql?(i[:object_attribute_id].to_s)}
      ["#{i[:table_name]}_#{i[:object_attribute_name]}",column[:name],i[:group_date_type]]
    }
    matrix_row_header_field = fields[2..3].compact.collect{|i|
      column = self.report_type_column_array.detect{|e| e[:object_attribute_id].to_s.eql?(i[:object_attribute_id].to_s)}
      ["#{i[:table_name]}_#{i[:object_attribute_name]}",column[:name],i[:group_date_type]]
    }
    [matrix_column_header_field,matrix_row_header_field]
  end


  # 表格标题
  def report_header
    return @report_header if @report_header
    @report_header = []
    report_column_array.each do |i|
      if ["LOOKUP_RELATION","MASTER_DETAIL_RELATION"].include?(i[:object_attribute_category])
        @report_header << ["#{i[:table_name]}_#{i[:object_attribute_name]}_label",report_type_column_array.detect{|e| e[:object_attribute_id].to_s.eql?(i[:object_attribute_id].to_s)}[:name]]

      else
        @report_header << ["#{i[:table_name]}_#{i[:object_attribute_name]}",report_type_column_array.detect{|e| e[:object_attribute_id].to_s.eql?(i[:object_attribute_id].to_s)}[:name]]
      end
    end
    @report_header
  end


  def generate_scope
    query_scope = eval(generate_query_str).where(where_clause)
    if self.filter_date_field_id
      date_field = report_type_column_array.detect{|i| i[:field_id].eql?(self.filter_date_field_id)}
      if(date_field&&self.filter_date_from.present?)
        query_scope = query_scope.where("#{date_field[:table_name]}.#{date_field[:object_attribute_name]}>=?",self.filter_date_from)
      end
      if(date_field&&self.filter_date_to.present?)
        query_scope = query_scope.where("#{date_field[:table_name]}.#{date_field[:object_attribute_name]}<=?",self.filter_date_to)
      end
    end
    query_scope
  end

  #报表基础数据
  def report_meta_data
    self.generate_scope
  end

  #报表显示类型
  #1,数据显示列表
  #2,数据分组列表
  #3,矩阵列表
  def table_show_type
    return @table_show_type if @table_show_type
    group_field_ids = report_group_columns.collect{|i| i.field_id}
    indexes = []
    group_field_ids.each_with_index do |i,index|
      if i.present?
        indexes << index
      end
    end
    if(indexes.size==0)
      return "COMMON"
    end
    if ((indexes.include?(0)||indexes.include?(1))&&!(indexes.include?(2)||indexes.include?(3)))||((indexes.include?(2)||indexes.include?(3))&&!(indexes.include?(0)||indexes.include?(1)))
      return "GROUP"
    end
    if ((indexes.include?(0)||indexes.include?(1))&&(indexes.include?(2)||indexes.include?(3)))
      return "MATRIX"
    end
  end


  def editable(member_type,access_type,person_id)
    if(member_type.present?&&access_type&&person_id.present?)
      return true if person_id.to_s.eql?(self.created_by)
      if(!member_type.eql?("PRIVATE")&&access_type.eql?("READ_WRITE"))
        return true
      else
        return false
      end
    else
      return false
    end
  end

  def custom?
    "CUSTOM".eql?(self.program_type)
  end

  def clear_id
    tmp_id = self.id
    self.id = ""
    return tmp_id
  end

  def set_id(id)
    self.id = id
  end

  def show_detail?
    Irm::Constant::SYS_YES.eql?(self.detail_display_flag)
  end

  def show_chart?
    ["PIE","BAR","COLUMN","LINE"].include?(self.chart_type)
  end

  #自动运行报表
  def auto_run?
    self.auto_run_flag.eql?(Irm::Constant::SYS_YES)
  end


  def program_instance
    return nil unless self.program_type.eql?("PROGRAM")&&self.program.present?
    @program_instance||= Irm::ReportManager.report_instance(self.program)
  end


  def group_report_metadata
    unless self.table_show_type.eql?("GROUP")
      return {}
    end
    fields = self.group_fields
    metadata = self.report_meta_data
    grouped_data = {}
    # 报表数据一组分组
    case fields[0][2]
      when nil
        grouped_data = metadata.group_by{|i| i[fields[0][0]]}
      when "DAY"
        grouped_data = metadata.group_by{|i| i[fields[0][0]].strftime("%Y-%m-%d")}
      when "MONTH"
        grouped_data = metadata.group_by{|i| i[fields[0][0]].strftime("%Y-%m")}
      when "YEAR"
        grouped_data = metadata.group_by{|i| i[fields[0][0]].year.to_s}
    end

    # 报表数据二级分组
    grouped_data.dup.each do |key,value|
      case fields[1][2]
        when nil
          grouped_data[key] = value.group_by{|i| i[fields[1][0]]}
        when "DAY"
          grouped_data[key] = value.group_by{|i| i[fields[1][0]].strftime("%Y-%m-%d")}
        when "MONTH"
          grouped_data[key] = value.group_by{|i| i[fields[1][0]].strftime("%Y-%m")}
        when "YEAR"
          grouped_data[key] = value.group_by{|i| i[fields[1][0]].year.to_s}
      end
    end  if(fields.size==2)
    # 返回分组后的数据
    grouped_data
  end

  private
  # 检查查询条件
  def validate_raw_condition_clause
    # 检查行号
    seq_nums = self.raw_condition_clause.scan(/\d+/)
    seq_nums.each do |sq|
      unless self.report_criterions.detect{|rc| rc.field_id&&!rc.field_id.blank?&&rc.seq_num == sq.to_i}
        errors.add(:raw_condition_clause,I18n.t(:view_filter_use_invalid_seq_num)+":#{sq}")
        break
      end
    end
    # 检查关键字
    key_words = self.raw_condition_clause.scan(/[A-Z]+/)
    key_words.each do |kw|
      unless kw.eql?("AND")||kw.eql?("OR")
        errors.add(:raw_condition_clause,I18n.t(:view_filter_use_invalid_key_word)+":#{kw}")
        break
      end
    end
    # 检查and or 语法
    info = ""
    begin
      eval(self.raw_condition_clause.downcase)
    rescue StandardError,SyntaxError, NameError=>text
          info = text
    end
    unless info.blank?
      errors.add(:raw_condition_clause,I18n.t(:view_filter_use_invalid_syntax))
    end
  end

  def set_condition
    self.condition_clause = generate_condition
    self.query_str_cache = generate_query_str
  end

  def generate_condition
    conditions = {}
    self.raw_condition_clause||=""
    report_criterions.each{|rc| conditions.merge!(rc.seq_num=>rc.to_condition(self.report_type.table_name_hash)) if rc.field_id.present?}
    seq_nums = self.raw_condition_clause.scan(/\d+/)
    clause = self.raw_condition_clause.dup
    # 将数据换成带^符号的数字
    # 防止参数中出现数字出现替换错误
    seq_nums.each do |sq|
      clause.gsub!(sq,"^#{sq}")
    end
    seq_nums.each do |sq|
      clause.gsub!("^#{sq}",conditions[sq.to_i])
    end
    clause

    # 生成参数查询条件

    params_clause = []
    self.param_criterions.each do |param_criterion|
      if param_criterion.field_id.present?&&self.program_params["#{param_criterion.field_id}"].present?
        param_criterion.filter_value = self.program_params["#{param_criterion.field_id}"]
        if param_criterion.valid?
          params_clause << param_criterion.to_condition(self.report_type.table_name_hash)
        end
      end
    end

    result_clause = ""

    result_clause << clause if clause.present?

    if params_clause.any?
      result_clause << " AND "  if clause.present?
      result_clause << params_clause.join(" AND ")
    end
    result_clause
  end

  def where_clause
    where_conditon = generate_condition
    params = where_conditon.scan(/\{\{\S*\}\}/)
    param_values = []
    params.each do |p|
      p.gsub!(/[\{\}]/,"")
      param_values << eval(p)
    end
    params
    where_conditon.gsub!(/\{\{\S*\}\}/,"?")
    where_conditon = ([where_conditon]+param_values).flatten
    where_conditon = where_conditon[0] unless where_conditon.length>1
    where_conditon
  end


  def generate_query_str
    select_fields = report_column_array.collect do |i|
      if ["LOOKUP_RELATION","MASTER_DETAIL_RELATION"].include?(i[:object_attribute_category])
        "#{i[:table_name]}.#{i[:object_attribute_name]} #{i[:table_name]}_#{i[:object_attribute_name]},#{i[:table_name]}.#{i[:object_attribute_name]}_label #{i[:table_name]}_#{i[:object_attribute_name]}_label"

      else
        "#{i[:table_name]}.#{i[:object_attribute_name]} #{i[:table_name]}_#{i[:object_attribute_name]}"
      end
    end

    self.report_type.generate_scope<<%Q{.select("#{select_fields.join(",")}")}
  end

end
