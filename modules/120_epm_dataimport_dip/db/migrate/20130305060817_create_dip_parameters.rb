class CreateDipParameters < ActiveRecord::Migration
  def up
    create_table :dip_parameters do |t|
      t.string :name, :limit => 255
      t.string :name_alias,:limit=>255
      t.string :header_id, :limit => 22
      t.integer :index_no
      t.string :scope, :limit => 255
      t.string :param_type,:limit=>255
      t.string :created_by
      t.string :updated_by
      t.timestamps
    end
    change_column :dip_parameters, "id", :string, :limit => 22
  end

  def down
    drop_table :dip_parameters
  end
end
