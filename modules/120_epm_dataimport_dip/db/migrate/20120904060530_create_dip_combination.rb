class CreateDipCombination < ActiveRecord::Migration
  def up
    create_table :dip_combination do |t|
      t.string :name, :limit => 100,:null=>false
      t.string :code, :limit=>30,:null=>false
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_combination, "id", :string, :limit => 22
  end

  def down
    drop_table :dip_combination
  end
end
