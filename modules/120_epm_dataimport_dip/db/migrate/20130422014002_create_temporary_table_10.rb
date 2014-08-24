class CreateTemporaryTable10 < ActiveRecord::Migration
  def up
    create_table(:dip_temporary_table_10) do |t|
      t.string :batch_id, :limit => 32, :collate => "utf8_bin"
      t.string :sheet_name,:limit=>255
      t.integer :sheet_no
      t.integer :row_number
      t.string :template_id, :limit => 22, :collate => "utf8_bin", :null => false
      t.string :combination_record, :limit => 22, :collate => "utf8_bin"
      t.string :target_id,:limit=>32
      t.string :cols1, :collate => "utf8_bin", :limit => 255
      t.string :cols2, :collate => "utf8_bin", :limit => 255
      t.string :cols3, :collate => "utf8_bin", :limit => 255
      t.string :cols4, :collate => "utf8_bin", :limit => 255
      t.string :cols5, :collate => "utf8_bin", :limit => 255
      t.string :cols6, :collate => "utf8_bin", :limit => 255
      t.string :cols7, :collate => "utf8_bin", :limit => 255
      t.string :cols8, :collate => "utf8_bin", :limit => 255
      t.string :cols9, :collate => "utf8_bin", :limit => 255
      t.string :cols10, :collate => "utf8_bin", :limit => 255
      ##
      t.string :cols1001, :collate => "utf8_bin", :limit => 255
      t.string :cols1002, :collate => "utf8_bin", :limit => 255
      t.string :cols1003, :collate => "utf8_bin", :limit => 255
      t.string :cols1004, :collate => "utf8_bin", :limit => 255
      t.string :cols1005, :collate => "utf8_bin", :limit => 255
      t.string :cols1006, :collate => "utf8_bin", :limit => 255
      t.string :cols1007, :collate => "utf8_bin", :limit => 255
      t.string :cols1008, :collate => "utf8_bin", :limit => 255
      t.string :cols1009, :collate => "utf8_bin", :limit => 255
      t.string :cols1010, :collate => "utf8_bin", :limit => 255
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_temporary_table_10, "id", :string, :limit => 32, :collate => "utf8_bin"
    add_index(:dip_temporary_table_10, :batch_id, :name => :dip_temporary_table_10_n1)
    add_index(:dip_temporary_table_10, :template_id, :name => :dip_temporary_table_10_n2)
    add_index(:dip_temporary_table_10,[:batch_id, :target_id],:name=>:dip_temporary_table_10_n3)
  end

  def down
    drop_table :dip_temporary_table_10
  end
end
