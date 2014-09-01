class CreateDipAuthorityxes < ActiveRecord::Migration
  def change
    create_table :dip_authorityxes do |t|
      t.string :person_id,:limit=>22
      t.string :function_type,:limit=>20
      t.string :function,   :limit=>22
      t.string :version,    :limit=>36
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_authorityxes, "id", :string, :limit => 22
    add_index(:dip_authorityxes,:person_id,:name=>:dip_authorityxes_i01)
    add_index(:dip_authorityxes,:function_type,:name=>:dip_authorityxes_i02)
    add_index(:dip_authorityxes,:function,:name=>:dip_authorityxes_i03)
  end

end
