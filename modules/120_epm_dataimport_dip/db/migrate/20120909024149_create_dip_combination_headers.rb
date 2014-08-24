class CreateDipCombinationHeaders < ActiveRecord::Migration
  def up
    create_table :dip_combination_headers do |t|
      t.string :combination_id, :limit => 22, :collate => "utf8_bin"
      t.string :header_id, :limit => 22, :collate => "utf8_bin"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_combination_headers, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_combination_headers
  end
end
