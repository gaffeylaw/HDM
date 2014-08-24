class CreateDipTemplateColumn < ActiveRecord::Migration
  def up
    create_table(:dip_template_column) do |t|
      t.string :name, :limit => 100, :collate => "utf8_bin"
      t.string :template_id, :limit => 22, :collate => "utf8_bin", :null => false
      t.string :column_name, :limit => 30, :collate => "utf8_bin"
      t.string :view_column, :limit=>30
      t.integer :index_id
      t.boolean :is_pk, :default => false
      t.boolean :mapped, :default => false
      t.boolean :omitted, :default => false
      t.string :data_type, :limit => 20, :default => "VARCHAR2"
      t.boolean :editable, :default => true
      t.string :value_list, :string, :limit => 255
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    add_index :dip_template_column, :template_id, :name => :dip_template_columns_id_n1
    change_column :dip_template_column, "id", :string, :limit => 22, :collate => "utf8_bin"
  end

  def down
    drop_table :dip_template_column
  end
end
