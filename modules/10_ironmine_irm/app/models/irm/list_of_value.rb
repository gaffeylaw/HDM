class Irm::ListOfValue < ActiveRecord::Base
  set_table_name :irm_list_of_values

  belongs_to :business_object,:foreign_key=>:bo_code,:primary_key=>:business_object_code

  #多语言关系
  attr_accessor :name,:description,:value_title,:desc_title,:addition_title
  has_many :list_of_values_tls
  acts_as_multilingual({:columns =>[:name,:description,:value_title,:desc_title,:addition_title],:required=>[:name,:value_title]})

  validates_presence_of :lov_code,:bo_code,:id_column,:value_column
  validates_uniqueness_of :lov_code,:scope=>[:opu_id],:if => Proc.new { |i| !i.lov_code.blank? }
  validates_format_of :lov_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.lov_code.blank?} ,:message=>:code

  #加入activerecord的通用方法和scope
  query_extend

  def self.current_opu(from_table_name = table_name)
    where({})
  end

  scope :with_bo,lambda{|language|
    joins("JOIN #{Irm::BusinessObject.view_name} ON #{Irm::BusinessObject.view_name}.business_object_code = #{table_name}.bo_code AND #{Irm::BusinessObject.view_name}.language ='#{language}'").
    select("#{Irm::BusinessObject.view_name}.name bo_name")
  }



  def generate_scope(options={})
    model_query = self.business_object.generate_query_by_hash_attributes(self.lov_column_hash,true)
    where_clause_str = ""
    lov_id_value = options.delete(:id_value)

    # parse id value
    if lov_id_value.present?
        where_clause_str << %(.where("#{self.business_object.bo_table_name}.#{self.id_column} = '#{lov_id_value}'"))
    end

    # parse params in where clause
    if !self.where_clause.nil?&&!self.where_clause.strip.blank?
      if %r{\{\{.*\}\}}.match(self.where_clause)
        where_clause_template = Liquid::Template.parse self.where_clause
        where_clause_str << %(.where("#{where_clause_template.render({"master_table"=>self.business_object.bo_table_name})}"))
      else
        where_clause_str << %(.where("#{self.where_clause}"))
      end
    end

    if !self.query_clause.nil?&&!self.query_clause.strip.blank?&&options[:show_value]&&!options[:show_value].blank?
      if %r{\{\{.*\}\}}.match(self.query_clause)
        query_clause_template = Liquid::Template.parse self.query_clause
        where_clause_str << %(.where("#{query_clause_template.render({"master_table"=>self.business_object.bo_table_name,"query"=>options[:desc_value]})}"))
      else
        where_clause_str << %(.where("#{self.query_clause}"))
      end
    end
    model_query = model_query+where_clause_str
    model_query
  end

  def lov_column_hash
    column_hash = {self.id_column=>"id_value",self.value_column=>"show_value"}
    column_hash.merge!(self.desc_column=>"desc_value") if self.desc_column.present?
    addition_column.split("#").each do |ac|
      column_hash.merge!({ac=>ac})
    end unless addition_column.nil? || addition_column.strip.blank?
    column_hash
  end

  def lov_columns
    columns = [:id_value,:value,:desc_value]
    addition_column.split("#").each do |ac|
      columns << ac.to_sym
    end unless addition_column.nil? || addition_column.strip.blank?
    columns
  end

  def lov_value(id_value)
    lov_value = eval(generate_scope(:id_value=>id_value)).first
    lov_value = lov_value[:show_value] if lov_value
    lov_value
  end


end
