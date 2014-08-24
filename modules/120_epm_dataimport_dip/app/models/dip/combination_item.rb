class Dip::CombinationItem < ActiveRecord::Base
  set_table_name :dip_combination_items
  query_extend
  validates_presence_of :combination_record_id, :header_value_id
  belongs_to :combination_record
end
