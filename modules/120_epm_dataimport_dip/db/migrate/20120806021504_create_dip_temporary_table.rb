class CreateDipTemporaryTable < ActiveRecord::Migration
  def up
    create_table(:dip_temporary_table) do |t|
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_temporary_table, "id", :string, :limit => 32, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_temporary_table
  end
end
