class CreateDipValidation < ActiveRecord::Migration
  def up
    create_table(:dip_validation) do |t|
      t.string :name, :limit => 100, :collate => "utf8_bin"
      t.string :program, :limit => 100, :collate => "utf8_bin"
      t.text :description, :limit => 512, :collate => "utf8_bin"
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_validation, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_validation
  end
end
