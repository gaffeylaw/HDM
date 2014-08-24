class CreateDipDipCategories < ActiveRecord::Migration
  def up
    create_table :dip_dip_categories do |t|
      t.string :name,:limit=>255,:collate=>"utf8_bin"
      t.string :parent,:limit=>22,:collate=>"utf_bin"
      t.string :category_type,:limit=>100
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_dip_categories, "id", :string, :limit => 22, :collate => "utf8_bin"
    add_index :dip_dip_categories,:category_type,:name=>:dip_dip_categories_n1
  end
  def down
    drop_table :dip_dip_categories
  end
end
