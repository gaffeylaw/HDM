class Dip::Header < ActiveRecord::Base
  set_table_name :dip_header
  query_extend
  validates_presence_of :name, :code
  validates_uniqueness_of :name, :code
  has_many :parameter, :dependent => :destroy
  has_many :header_value, :dependent => :destroy
end
