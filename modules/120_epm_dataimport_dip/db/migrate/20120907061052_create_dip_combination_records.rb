class CreateDipCombinationRecords < ActiveRecord::Migration
  def up
    create_table :dip_combination_records do |t|
      t.string :combination_id, :limit => 22, :collate => "utf8_bin"
      t.string :combination_key,:limit=>400
      t.integer :enabled,:default => 0
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_combination_records, "id", :string, :limit => 22, :collate => "utf8_bin"
    add_index :dip_combination_records, "combination_id", :name => :dip_combination_records_n1
    add_index :dip_combination_records, "combination_key", :name => :dip_combination_records_n2
  end

  def down
    drop_table :dip_combination_records
  end
end
