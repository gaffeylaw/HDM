class CreateDipInfaWorkflows < ActiveRecord::Migration
  def up
    create_table :dip_infa_workflows do |t|
      t.string :repository_id, :limit => 22
      t.string :name, :limit => 255
      t.string :name_alias, :limit => 255
      t.string :folder_name, :limit => 255
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_infa_workflows, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_infa_workflows
  end
end
