class Dip::Error < ActiveRecord::Base
  set_table_name :dip_error
  query_extend
end
