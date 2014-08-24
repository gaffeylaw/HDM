class Dip::Validation < ActiveRecord::Base
  set_table_name :dip_validation
  query_extend
  validates_presence_of :name, :program, :description
  validates_uniqueness_of :name, :program
  has_many :template_validation,:dependent => :destroy
end
