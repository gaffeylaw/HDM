class CreateDipParameterSets < ActiveRecord::Migration
  def up
    create_table :dip_parameter_sets do |t|
      t.string :name, :limit => 255, :collate => "utf8_bin"
      t.string :param_type, :limit => 255
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_parameter_sets, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_parameter_sets
  end
end
