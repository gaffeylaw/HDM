class AddIndexNoToValidation < ActiveRecord::Migration
  def up
    add_column :dip_template_validation, :index_no, :integer
  end

  def down
    remove_column :dip_template_validation, :index_no
  end
end
