class Dip::DipReport < ActiveRecord::Base
  set_table_name :dip_dip_reports
  query_extend
  validates_presence_of :name,:columns,:columns_desc,:program
  has_many :dip_authority,:dependent => :destroy,:foreign_key => :function
end
