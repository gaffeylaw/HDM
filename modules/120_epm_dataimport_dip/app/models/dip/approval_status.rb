class Dip::ApprovalStatus < ActiveRecord::Base
  set_table_name :dip_approval_statuses
  query_extend
end
