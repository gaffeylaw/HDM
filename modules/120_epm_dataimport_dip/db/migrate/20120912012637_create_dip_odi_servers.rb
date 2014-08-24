class CreateDipOdiServers < ActiveRecord::Migration
  def up
    create_table :dip_odi_servers do |t|
      t.string :server_name, :limit => 100, :collate => "utf8_bin"
      t.string :server_desc, :limit => 100, :collate => "utf8_bin"
      t.string :url, :limit => 100, :collate => "utf8_bin"
      t.string :workspace, :limit => 100, :collate => "utf8_bin"
      t.string :odi_user, :limit => 32, :collate => "utf8_bin"
      t.string :odi_pwd, :limit => 100, :collate => "utf8_bin"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_odi_servers, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_odi_servers
  end
end
