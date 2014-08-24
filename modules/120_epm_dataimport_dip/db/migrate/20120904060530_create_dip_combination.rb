class CreateDipCombination < ActiveRecord::Migration
  def up
    create_table :dip_combination do |t|
      t.string :name, :limit => 100, :collate => "utf8_bin"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_combination, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_combination
  end
end
