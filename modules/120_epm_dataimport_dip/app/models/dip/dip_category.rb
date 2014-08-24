class Dip::DipCategory < ActiveRecord::Base
  set_table_name :dip_dip_categories
  query_extend
  validates_presence_of :category_type, :name
  validate :validate_category_type
  validate :validate_parent
  validate :validate_sub_unique

  def validate_category_type
    errors.add(:category_type, I18n.t(:invalid_data)) unless [Dip::DipConstant::CATEGORY_TEMPLATE, Dip::DipConstant::CATEGORY_REPORT, Dip::DipConstant::CATEGORY_ODI, Dip::DipConstant::CATEGORY_INFA].include? self.category_type
  end

  def validate_sub_unique
    errors.add(:name, I18n.t(:label_existed)) if Dip::DipCategory.where({:name => self.name, :parent => self[:parent], :category_type => self.category_type}).any?
  end

  def validate_parent
    if self.parent.to_s.strip==""
      self.parent=nil
    end
    errors.add(:parent, I18n.t(:label_not_existed)) if !self.parent.nil? && Dip::DipCategory.where({:id=>self[:parent]}).size<1
  end

  def self.get_all_child(id)
    children=id.nil? ? [] : [id]
    Dip::DipCategory.where(:parent => id).each do |c|
      children=children+get_all_child(c[:id])
    end
    children
  end

  def self.get_full_path(category)
    path=category.name
    c=category
    while c.parent
      c=Dip::DipCategory.find(c.parent)
      path=c.name+"/"+path
    end
    path
  end

end
