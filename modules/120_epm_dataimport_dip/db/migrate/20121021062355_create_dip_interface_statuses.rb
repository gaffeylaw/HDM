class CreateDipInterfaceStatuses < ActiveRecord::Migration
  def up
    create_table :dip_interface_statuses do |t|
      t.string :interface_category_id, :limit => 22, :collate => "utf8_bin"
      t.string :interface_id, :limit => 22, :collate => "utf8_bin"
      t.string :session_id, :limit => 32, :collate => "utf8_bin"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_interface_statuses, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_interface_statuses
  end
end
