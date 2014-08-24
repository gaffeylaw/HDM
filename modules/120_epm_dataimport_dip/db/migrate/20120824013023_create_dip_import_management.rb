class CreateDipImportManagement < ActiveRecord::Migration
  def up
    create_table :dip_import_management do |t|
    t.string  :template_id  ,:limit => 22, :collate=>"utf8_bin",:null=>false
    t.string  :batch_id,     :limit =>32, :collate=>"utf8_bin"
    t.string  :combination_record_id, :limit => 22
    t.integer :percent
    t.integer :status
    t.string  :created_by,        :limit => 22, :collate=>"utf8_bin"
    t.string  :updated_by,        :limit => 22, :collate=>"utf8_bin"
    t.timestamps
    end
    change_column :dip_import_management, "id", :string,:limit=>22, :collate=>"utf8_bin"
    add_index :dip_import_management,:template_id,:name=>:dip_import_manage_n1
  end
  def down
    drop_table :dip_import_management
  end
end
