class CreateDipUser < ActiveRecord::Migration
  def change
    create_table :dip_user do |t|
      t.string :user_acc,:limit=>30, :nil=>false
      t.string :mail_addr,:limit=>150, :nil=>false
      t.string :name,:limit=>60, :nil=>false
      t.string :profile,:limit=>60, :nil=>false
      t.string :org_id,:limit=>22, :nil=>false
      t.string :org_name,:limit=>150, :nil=>false
      t.string :phone,:limit=>30, :nil=>false
      t.string :default_pwd,:limit=>60, :nil=>false
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.string :combination_record,:limit=>22
      t.string :batch_id,:limit=>32
      t.integer :idx
      t.timestamps
    end
    execute %{alter table dip_user drop column id}
    execute %{create or replace view dip_user_v as select t.rowid row_id,t.* from dip_user t }
  end

end
