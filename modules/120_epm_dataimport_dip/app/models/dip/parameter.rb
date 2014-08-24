class Dip::Parameter < ActiveRecord::Base
  set_table_name :dip_parameters
  query_extend
  validates_presence_of :index_no,:name,:name_alias,:param_type
  validates_numericality_of :index_no
  validates_uniqueness_of :name_alias,:scope => :param_type
end
