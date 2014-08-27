class CreateDipHeader < ActiveRecord::Migration
  def up
    create_table :dip_header do |t|
      t.string :id, :limit => 22,:null => false
      t.string :code, :limit => 28,:null=>false
      t.string :name, :limit => 100,:null=>false
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.timestamps
    end
    change_column :dip_header, "id", :string, :limit => 22, :collate => "utf8_bin"
    #auto_increment(:dip_header, {:primary_key => :index, :sequence_name => :dip_header_index_seq, :primary_key_trigger => true})
  end

  def down
    drop_table :dip_header
  end
end
