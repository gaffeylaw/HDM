class CreateDipOrganization < ActiveRecord::Migration
  def change
    create_table :dip_organization do |t|
      t.string :org_name,:limit=>150, :nil=>false
      t.string :p_org_id,:limit=>22
      t.string :p_org_name,:limit=>150
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.string :combination_record,:limit=>22
      t.string :batch_id,:limit=>32
      t.integer :idx
      t.timestamps
    end
    change_column :dip_organization, "id", :string, :limit => 22
    execute %{create or replace view dip_organization_v as select t.rowid row_id,t.* from dip_organization t }
    add_index(:dip_organization,:p_org_id,:name=>:dip_organization_i01)
  end

end
