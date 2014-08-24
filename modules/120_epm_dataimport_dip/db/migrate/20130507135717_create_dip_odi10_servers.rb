class CreateDipOdi10Servers < ActiveRecord::Migration
  def up
    create_table :dip_odi10_servers do |t|
      t.string :server_name,:limit=>200
      t.string :jdbc_driver, :limit => 200
      t.string :jdbc_url, :limit => 200
      t.string :jdbc_user, :limit => 100
      t.string :jdbc_password, :limit => 100
      t.string :work_repository, :limit => 100
      t.string :odi_user, :limit => 100
      t.string :odi_password, :limit => 100
      t.string :agent_host, :limit => 100
      t.string :agent_port, :limit => 30
      t.timestamps
    end
    change_column :dip_odi10_servers, "id", :string, :limit => 22
  end

  def down
    drop_table :dip_odi10_servers
  end
end
