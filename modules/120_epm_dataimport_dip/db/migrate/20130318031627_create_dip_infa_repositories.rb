class CreateDipInfaRepositories < ActiveRecord::Migration
  def up
    create_table :dip_infa_repositories do |t|
      t.string :service_url, :limit => 255
      t.string :repository_domain_name, :limit => 255
      t.string :repository_name, :limit => 255
      t.string :repository_alias, :limit => 255
      t.string :user_name, :limit => 100
      t.string :password, :limit => 100
      t.string :user_namespace, :limit => 255
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_infa_repositories, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_infa_repositories
  end
end
