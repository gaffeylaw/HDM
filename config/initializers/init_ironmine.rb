begin
  ActiveRecord::Base.send(:include,Dip::NotInsertNil)
  DB_ADAPTER=Ironmine::Application.config.database_configuration[Rails.env]["adapter"].to_s.upcase
  DB_OWNER= Ironmine::Application.config.database_configuration[Rails.env]["username"].to_s.upcase
  #jars = Dir.glob(Rails.root.to_s + "/lib/javalib/poi/*.jar").join(':')
  #Rjb::load(jars,['-Xmx100m'])
end
