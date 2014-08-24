class Dip::TemplateColumn < ActiveRecord::Base
  set_table_name :dip_template_column
  query_extend
  validates_presence_of :name, :template_id, :column_name
  belongs_to :template
  has_many :template_validation, :dependent => :destroy
  #validates_uniqueness_of :name,:column_name
end
