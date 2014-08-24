class AddCategoryIdToWorkflow < ActiveRecord::Migration
  def up
    add_column :dip_infa_workflows,:category_id,:string,:limit => 22
  end
  def down
    remove_column :dip_infa_workflows,:category_id
  end
end
