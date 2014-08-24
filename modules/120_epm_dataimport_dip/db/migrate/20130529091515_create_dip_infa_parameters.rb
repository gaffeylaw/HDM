class CreateDipInfaParameters < ActiveRecord::Migration
  def up
    create_table :dip_infa_parameters do |t|
      t.string :category_id, :limit => 22
      t.string :parameter_set_id, :limit=>22
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_infa_parameters, "id", :string, :limit => 22
  end

  def down
    drop_table :dip_infa_parameters
  end
end
