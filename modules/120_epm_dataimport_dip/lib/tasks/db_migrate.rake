namespace :db do
  task :migratedb => :environment do
    require "active_record/connection_adapters/oracle_enhanced_schema_statements"
    ActiveRecord::ConnectionAdapters::OracleEnhancedSchemaStatements.send(:include, Dip::OracleId)
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
    # main app migrate
    migrate_paths = ["db/*/*"]
    migrate_paths = ["modules/120_epm_dataimport_dip/db//*"]
    # modules migrate
    #Rails.application.paths["db/migrate"][0..Rails.application.paths["db/migrate"].length-2].each do |f|
    #  migrate_paths << "#{f.to_s.gsub('migrate', '')}/*"
    #end if Rails.application.paths["db/migrate"].length > 1

    Fwk::Migrator::TableMigrator.migrate(migrate_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil)
    Rake::Task["db:schema:dump"].invoke if ActiveRecord::Base.schema_format == :ruby
  end
end