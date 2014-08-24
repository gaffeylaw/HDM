class Irm::ProductModule < ActiveRecord::Base
  set_table_name :irm_product_modules
  has_many :product_modules_tls, :foreign_key=>"product_id"
  validates_uniqueness_of :product_short_name, :if => Proc.new { |i| !i.product_short_name.blank? }
  validates_presence_of :product_short_name
  attr_accessor :name, :description
  #如果语言表里面字段不是name和description的话，需要特别指出
  acts_as_multilingual
  query_extend

  scope :query_by_short_name,lambda{|short_name|
    where(:product_short_name=>short_name)
  }

  def self.usable?(module_name)
    self.where(:installed_flag => Irm::Constant::SYS_YES,:product_short_name => module_name.to_s.upcase).exists?
  end
end
