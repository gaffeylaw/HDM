class CreateDipApprovalStatuses < ActiveRecord::Migration
  def change
    create_table :dip_approval_statuses do |t|
      t.string :template_id, :limit=>22
      t.string :combination_record,:limit=>22
      t.string :approval_status,:limit=>20
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_approval_statuses, "id", :string, :limit => 22
  end
end
