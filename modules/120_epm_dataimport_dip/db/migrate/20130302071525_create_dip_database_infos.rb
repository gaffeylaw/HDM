class CreateDipDatabaseInfos < ActiveRecord::Migration
  def up
    create_table :dip_database_infos do |t|
      t.string :db_alias,:limit=>255,:collate=>"utf8_bin"
      t.string :db_user,:limit=>32,:collate=>"utf8_bin"
      t.string :db_pwd,:limit=>32,:collate=>"utf8_bin"
      t.string :db_addr,:limit=>100,:collate=>"utf8_bin"
      t.string :db_port,:limit=>32
      t.string :db_name,:limit=>100
    end
    change_column :dip_database_infos, "id", :string, :limit => 22, :collate => "utf8_bin"
  end
  def down
    drop_table :dip_database_infos
  end
end
