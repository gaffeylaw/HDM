class CreateDipDipAuthorities < ActiveRecord::Migration
  def up
    create_table :dip_dip_authorities do |t|
      t.string :target,:limit=>255,:collate=>"utf8_bin"
      t.string :target_type,:limit=>255,:collate=>"utf8_bin"
      t.string :function,:limit=>255,:collate=>"utf8_bin"
      t.string :function_type,:limit=>255,:collate=>"utf8_bin"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_dip_authorities, "id", :string, :limit => 22, :collate => "utf8_bin"
    add_index :dip_dip_authorities,:target_type,:name=> :dip_dip_authorities_n1
    add_index :dip_dip_authorities,:function_type,:name=> :dip_dip_authorities_n2
    add_index :dip_dip_authorities,:target,:name=>:dip_dip_authorities_n3
  end
  def down
    drop_table :dip_dip_authorities
  end
end
