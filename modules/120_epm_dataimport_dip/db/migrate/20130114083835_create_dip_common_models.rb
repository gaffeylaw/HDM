class CreateDipCommonModels < ActiveRecord::Migration
  def up
    create_table :dip_common_model do |t|
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_common_model, "id", :string, :limit => 22, :collate => "utf8_bin"
  end
  def down
    drop_table :dip_common_model
  end
end
