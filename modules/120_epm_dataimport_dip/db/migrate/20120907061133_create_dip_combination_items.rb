class CreateDipCombinationItems < ActiveRecord::Migration
  def up
    create_table :dip_combination_items do |t|
      t.string :combination_record_id, :limit => 22, :collate => "utf8_bin"
      t.string :header_value_id, :limit => 22, :collate => "utf8_bin"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_combination_items, "id", :string, :limit => 22, :collate => "utf8_bin"
    add_index :dip_combination_items, "combination_record_id", :name => :dip_combination_items_n1
    add_index :dip_combination_items, "header_value_id", :name => :dip_combination_items_n2
  end

  def down
    drop_table :dip_combination_items
  end
end
