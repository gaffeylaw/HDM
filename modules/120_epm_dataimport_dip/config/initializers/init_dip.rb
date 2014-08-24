if DB_ADAPTER.to_s.include? "ORACLE"
  plsql.activerecord_class = ActiveRecord::Base
end
require "delayed/worker"

