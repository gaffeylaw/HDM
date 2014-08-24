class Dip::HeaderValue < ActiveRecord::Base
  set_table_name :dip_header_value
  query_extend
  validates_presence_of :header_id, :value, :code
  belongs_to :header
  has_many :dip_authority,:foreign_key => :function,:dependent => :destroy
  validates_uniqueness_of :value,:scope => :header_id
  validates_uniqueness_of :code, :scope => :header_id
end
