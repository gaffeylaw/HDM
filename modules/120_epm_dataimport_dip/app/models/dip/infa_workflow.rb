class Dip::InfaWorkflow < ActiveRecord::Base
  set_table_name :dip_infa_workflows
  validates_presence_of :name_alias,:repository_id,:name,:folder_name
  query_extend
  has_many :dip_authority,:foreign_key => :function,:dependent => :destroy

end
