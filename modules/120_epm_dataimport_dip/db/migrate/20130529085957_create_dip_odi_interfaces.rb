class CreateDipOdiInterfaces < ActiveRecord::Migration
  def up
    create_table :dip_odi_interfaces do |t|
      t.integer :interface_no
      t.string :interface_code, :limit => 100
      t.string :interface_name, :limit => 100
      t.string :interface_version, :limit=>32
      t.string :interface_context, :limit => 100
      t.string :interface_desc, :limit => 100
      t.string :server_id,:limit=>22
      t.string :server_version,:limit=>10
      t.integer :status,:default=>0
      t.string :category_id, :limit => 22
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_odi_interfaces, "id", :string, :limit => 22
  end

  def down
    drop_table :dip_odi_interfaces
  end
end
