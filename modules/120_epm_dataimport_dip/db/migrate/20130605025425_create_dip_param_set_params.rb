class CreateDipParamSetParams < ActiveRecord::Migration
  def up
    create_table :dip_param_set_params do |t|
      t.string :parameter_set_id, :limit=>22
      t.string :parameter_id, :limit=>22
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_param_set_params, "id", :string, :limit => 22
  end
  def down
    drop_table :dip_param_set_params
  end
end
