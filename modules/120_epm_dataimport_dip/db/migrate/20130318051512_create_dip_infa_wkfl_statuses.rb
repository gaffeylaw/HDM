class CreateDipInfaWkflStatuses < ActiveRecord::Migration
  def up
    create_table :dip_infa_wkfl_statuses do |t|
      t.string :workflow_set_id, :limit => 22
      t.string :workflow_id, :limit => 22
      t.integer :run_id
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_infa_wkfl_statuses, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_infa_wkfl_statuses
  end
end
