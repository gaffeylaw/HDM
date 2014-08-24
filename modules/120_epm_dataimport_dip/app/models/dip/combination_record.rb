class Dip::CombinationRecord < ActiveRecord::Base
  set_table_name :dip_combination_records
  query_extend
  validates_presence_of :combination_id
  belongs_to :combination
  has_many :combination_item, :dependent => :destroy
end
