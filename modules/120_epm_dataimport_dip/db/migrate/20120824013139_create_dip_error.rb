class CreateDipError < ActiveRecord::Migration
  def up
    create_table :dip_error, :id => false do |t|
      t.string :batch_id, :limit => 32, :collate => "utf8_bin"
      t.string :sheet_name,:limit=>255,:collate => "utf8_bin"
      t.string :sheet_no
      t.integer :row_number
      t.string :message, :limit => 255, :collate => "utf8_bin"
      t.string :locale, :limit => 10
      t.timestamps
    end
    add_index :dip_error, "batch_id", :name => :dip_error_n1
  end

  def down
    drop_table :dip_error
  end
end
