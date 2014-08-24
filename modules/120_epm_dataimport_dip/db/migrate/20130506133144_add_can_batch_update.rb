class AddCanBatchUpdate < ActiveRecord::Migration
  def up
    add_column :dip_template,:increment_import,:boolean,:default=>true
  end

  def down
    remove_column :dip_template,:increment_import
  end
end
