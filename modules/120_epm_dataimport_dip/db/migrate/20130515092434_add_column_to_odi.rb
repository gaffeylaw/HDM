class AddColumnToOdi < ActiveRecord::Migration
  def up
    add_column :dip_interface_statuses,:status,:string,:default=>'W'
    add_column :dip_interface_statuses,:log,:string
  end

  def down
    remove_column :dip_interface_statuses,:status
    remove_column :dip_interface_statuses,:log
  end
end
