class CreateDipTemplateValidation < ActiveRecord::Migration
  def up
    create_table(:dip_template_validation) do |t|
      t.string  :template_column_id,     :limit => 22, :collate=>"utf8_bin",:null=>false
      t.string  :validation_id,     :limit => 22, :collate=>"utf8_bin",:null=>false
      t.string  :args,              :limit=>100,  :collate=>"utf8_bin"
      t.string  :created_by,        :limit => 22, :collate=>"utf8_bin"
      t.string  :updated_by,        :limit => 22, :collate=>"utf8_bin"
      t.timestamps
    end
    add_index :dip_template_validation, :template_column_id,:name=>:dip_template_val_n1
    add_index :dip_template_validation, :validation_id ,:name=>:dip_template_val_n2
    change_column :dip_template_validation, "id", :string,:limit=>22, :collate=>"utf8_bin"
  end
  def down
    drop_table :dip_template_validation
  end
end
