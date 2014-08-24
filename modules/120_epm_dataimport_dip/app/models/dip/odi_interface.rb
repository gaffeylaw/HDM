class Dip::OdiInterface < ActiveRecord::Base
  set_table_name :dip_odi_interfaces
  query_extend
  validates_numericality_of :interface_no,:allow_nil=>true
  validates_uniqueness_of :interface_name
  validates_presence_of :interface_code,:interface_name,:interface_version,:interface_context,:server_id,:server_version
end
