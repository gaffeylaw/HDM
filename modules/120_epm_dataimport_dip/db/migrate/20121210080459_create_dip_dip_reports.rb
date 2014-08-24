class CreateDipDipReports < ActiveRecord::Migration
  def up
    create_table :dip_dip_reports do |t|
      t.string :name,:limit=>255,:collate=>"utf8_bin"
      t.string :db_info,:limit=>22
      t.boolean :is_pkg
      t.text   :program
      t.text   :columns
      t.text   :columns_desc
      t.text   :descs
      t.string :parameter_set_id,:limit=>22
      t.string :category_id,:limit=>22
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_dip_reports, "id", :string, :limit => 22, :collate => "utf8_bin"
    add_index :dip_dip_reports,:category_id,:name=>:dip_dip_reports_n1
  end
  def down
    drop_table  :dip_dip_reports
  end
end
