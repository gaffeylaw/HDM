begin
  ActiveRecord::Base.send(:include,Dip::NotInsertNil)
  DB_ADAPTER=Ironmine::Application.config.database_configuration[Rails.env]["adapter"].to_s.upcase
  DB_OWNER= Ironmine::Application.config.database_configuration[Rails.env]["username"].to_s.upcase

end