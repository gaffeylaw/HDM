class AddColumnLength < ActiveRecord::Migration
  def up
    add_column :dip_template_column,:column_length,:number,:default=>100
  end

  def down
    remove_column :dip_template_column,:column_length
  end
end
