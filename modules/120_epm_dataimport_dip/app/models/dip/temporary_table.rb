class Dip::TemporaryTable < ActiveRecord::Base
  set_table_name :dip_temporary_table
  query_extend
end
