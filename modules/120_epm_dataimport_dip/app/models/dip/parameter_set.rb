class Dip::ParameterSet < ActiveRecord::Base
  set_table_name :dip_parameter_sets
  query_extend
  has_many :param_set_param,:dependent => :destroy
  validates_presence_of :name
  validates_uniqueness_of :name
end
