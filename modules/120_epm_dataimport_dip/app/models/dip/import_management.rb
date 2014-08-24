class Dip::ImportManagement < ActiveRecord::Base
  set_table_name :dip_import_management
  query_extend
  validates_presence_of :template_id, :batch_id
  belongs_to :template
end
