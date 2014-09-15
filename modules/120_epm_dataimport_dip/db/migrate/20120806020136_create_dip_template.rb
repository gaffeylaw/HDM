class CreateDipTemplate < ActiveRecord::Migration
  def up
    create_table(:dip_template) do |t|
      t.string :code, :string, :limit => 100
      t.string :name, :limit => 100, :collate => "utf8_bin"
      t.string :descs, :string, :limit => 600
      t.boolean :overwritable, :default => false
      t.string :template_category_id, :limit => 22, :collate => "utf8_bin"
      t.string :temporary_table, :limit => 30, :default => 'dip_temporary_table_20'
      t.string :table_name, :limit => 30, :collate => "utf8_bin"
      t.string :query_view, :limit => 30, :collate => "utf8_bin"
      t.string :import_program, :limit => 250, :collate => "utf8_bin", :default => "HDM_COMMON_DATA_IMPORT.import_data"
      t.string :combination_id, :limit => 22, :collate => "utf8_bin"
      t.string :end_program, :limit => 255
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.string :file_name,:limit=>100
      t.timestamps
    end
    add_index :dip_template, :template_category_id, :name => :template_category_id_n1
    change_column :dip_template, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_template
  end
end
