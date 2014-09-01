class CreateDipApprovalNodes < ActiveRecord::Migration
  def change
    create_table :dip_approval_nodes do |t|
      t.string :template_id,:limit=>22
      t.string :combination_record,:limit=>22
      t.string :parent_node,:limit => 32
      t.string :approve_status,:limit=>20
      t.string :comment,:limit=>1000
      t.string :approver, :limit => 22
      t.string :committer,:limit=>22
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_approval_nodes, "id", :string, :limit => 32
  end
end
