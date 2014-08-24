class CreateDipHeaderValue < ActiveRecord::Migration
  def up
    create_table :dip_header_value do |t|
      t.string :header_id, :limit => 22, :collate => "utf8_bin", :null => false
      t.string :code,:limit=>100
      t.string :value, :limit => 100, :collate => "utf8_bin"
      t.boolean :enabled, :default => true
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_header_value, "id", :string, :limit => 22, :collate => "utf8_bin"
    add_index :dip_header_value, "header_id", :name => :dip_header_value_n1
  end

  def down
    drop_table :dip_header_value
  end
end
