class Dip::CombinationHeader < ActiveRecord::Base
  set_table_name :dip_combination_headers
  query_extend
  belongs_to :combination
  validates_presence_of :combination_id,:header_id
end
