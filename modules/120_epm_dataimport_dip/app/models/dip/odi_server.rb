class Dip::OdiServer < ActiveRecord::Base
  set_table_name :dip_odi_servers
  query_extend
end
