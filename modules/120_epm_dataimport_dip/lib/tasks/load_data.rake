namespace :db do
  task :loaddb => :environment do
    if defined? ActiveRecord::ConnectionAdapters::OracleEnhancedAdapter
      require "active_record/connection_adapters/oracle_enhanced_schema_statements"
      ActiveRecord::ConnectionAdapters::OracleEnhancedSchemaStatements.send(:include, Dip::OracleId)
    end
    file = ENV['SCHEMA'] || "#{Rails.root}/modules/120_epm_dataimport_dip/db/schema.rb"
    if File.exists?(file)
      load(file)
    else
      abort %{#{file} doesn't exist yet.}
    end
  end
end