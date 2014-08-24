class CreateTemporaryTable50 < ActiveRecord::Migration
  def up
    create_table(:dip_temporary_table_50) do |t|
      t.string :batch_id, :limit => 32, :collate => "utf8_bin"
      t.string :sheet_name, :limit => 255
      t.integer :sheet_no
      t.integer :row_number
      t.string :template_id, :limit => 22, :collate => "utf8_bin", :null => false
      t.string :combination_record, :limit => 22, :collate => "utf8_bin"
      t.string :target_id, :limit => 32
      t.string :cols1, :collate => "utf8_bin", :limit => 255
      t.string :cols2, :collate => "utf8_bin", :limit => 255
      t.string :cols3, :collate => "utf8_bin", :limit => 255
      t.string :cols4, :collate => "utf8_bin", :limit => 255
      t.string :cols5, :collate => "utf8_bin", :limit => 255
      t.string :cols6, :collate => "utf8_bin", :limit => 255
      t.string :cols7, :collate => "utf8_bin", :limit => 255
      t.string :cols8, :collate => "utf8_bin", :limit => 255
      t.string :cols9, :collate => "utf8_bin", :limit => 255
      t.string :cols10, :collate => "utf8_bin", :limit => 255
      t.string :cols11, :collate => "utf8_bin", :limit => 255
      t.string :cols12, :collate => "utf8_bin", :limit => 255
      t.string :cols13, :collate => "utf8_bin", :limit => 255
      t.string :cols14, :collate => "utf8_bin", :limit => 255
      t.string :cols15, :collate => "utf8_bin", :limit => 255
      t.string :cols16, :collate => "utf8_bin", :limit => 255
      t.string :cols17, :collate => "utf8_bin", :limit => 255
      t.string :cols18, :collate => "utf8_bin", :limit => 255
      t.string :cols19, :collate => "utf8_bin", :limit => 255
      t.string :cols20, :collate => "utf8_bin", :limit => 255
      t.string :cols21, :collate => "utf8_bin", :limit => 255
      t.string :cols22, :collate => "utf8_bin", :limit => 255
      t.string :cols23, :collate => "utf8_bin", :limit => 255
      t.string :cols24, :collate => "utf8_bin", :limit => 255
      t.string :cols25, :collate => "utf8_bin", :limit => 255
      t.string :cols26, :collate => "utf8_bin", :limit => 255
      t.string :cols27, :collate => "utf8_bin", :limit => 255
      t.string :cols28, :collate => "utf8_bin", :limit => 255
      t.string :cols29, :collate => "utf8_bin", :limit => 255
      t.string :cols30, :collate => "utf8_bin", :limit => 255
      t.string :cols31, :collate => "utf8_bin", :limit => 255
      t.string :cols32, :collate => "utf8_bin", :limit => 255
      t.string :cols33, :collate => "utf8_bin", :limit => 255
      t.string :cols34, :collate => "utf8_bin", :limit => 255
      t.string :cols35, :collate => "utf8_bin", :limit => 255
      t.string :cols36, :collate => "utf8_bin", :limit => 255
      t.string :cols37, :collate => "utf8_bin", :limit => 255
      t.string :cols38, :collate => "utf8_bin", :limit => 255
      t.string :cols39, :collate => "utf8_bin", :limit => 255
      t.string :cols40, :collate => "utf8_bin", :limit => 255
      t.string :cols41, :collate => "utf8_bin", :limit => 255
      t.string :cols42, :collate => "utf8_bin", :limit => 255
      t.string :cols43, :collate => "utf8_bin", :limit => 255
      t.string :cols44, :collate => "utf8_bin", :limit => 255
      t.string :cols45, :collate => "utf8_bin", :limit => 255
      t.string :cols46, :collate => "utf8_bin", :limit => 255
      t.string :cols47, :collate => "utf8_bin", :limit => 255
      t.string :cols48, :collate => "utf8_bin", :limit => 255
      t.string :cols49, :collate => "utf8_bin", :limit => 255
      t.string :cols50, :collate => "utf8_bin", :limit => 255
      ##
      t.string :cols1001, :collate => "utf8_bin", :limit => 255
      t.string :cols1002, :collate => "utf8_bin", :limit => 255
      t.string :cols1003, :collate => "utf8_bin", :limit => 255
      t.string :cols1004, :collate => "utf8_bin", :limit => 255
      t.string :cols1005, :collate => "utf8_bin", :limit => 255
      t.string :cols1006, :collate => "utf8_bin", :limit => 255
      t.string :cols1007, :collate => "utf8_bin", :limit => 255
      t.string :cols1008, :collate => "utf8_bin", :limit => 255
      t.string :cols1009, :collate => "utf8_bin", :limit => 255
      t.string :cols1010, :collate => "utf8_bin", :limit => 255
      t.string :cols1011, :collate => "utf8_bin", :limit => 255
      t.string :cols1012, :collate => "utf8_bin", :limit => 255
      t.string :cols1013, :collate => "utf8_bin", :limit => 255
      t.string :cols1014, :collate => "utf8_bin", :limit => 255
      t.string :cols1015, :collate => "utf8_bin", :limit => 255
      t.string :cols1016, :collate => "utf8_bin", :limit => 255
      t.string :cols1017, :collate => "utf8_bin", :limit => 255
      t.string :cols1018, :collate => "utf8_bin", :limit => 255
      t.string :cols1019, :collate => "utf8_bin", :limit => 255
      t.string :cols1020, :collate => "utf8_bin", :limit => 255
      t.string :cols1021, :collate => "utf8_bin", :limit => 255
      t.string :cols1022, :collate => "utf8_bin", :limit => 255
      t.string :cols1023, :collate => "utf8_bin", :limit => 255
      t.string :cols1024, :collate => "utf8_bin", :limit => 255
      t.string :cols1025, :collate => "utf8_bin", :limit => 255
      t.string :cols1026, :collate => "utf8_bin", :limit => 255
      t.string :cols1027, :collate => "utf8_bin", :limit => 255
      t.string :cols1028, :collate => "utf8_bin", :limit => 255
      t.string :cols1029, :collate => "utf8_bin", :limit => 255
      t.string :cols1030, :collate => "utf8_bin", :limit => 255
      t.string :cols1031, :collate => "utf8_bin", :limit => 255
      t.string :cols1032, :collate => "utf8_bin", :limit => 255
      t.string :cols1033, :collate => "utf8_bin", :limit => 255
      t.string :cols1034, :collate => "utf8_bin", :limit => 255
      t.string :cols1035, :collate => "utf8_bin", :limit => 255
      t.string :cols1036, :collate => "utf8_bin", :limit => 255
      t.string :cols1037, :collate => "utf8_bin", :limit => 255
      t.string :cols1038, :collate => "utf8_bin", :limit => 255
      t.string :cols1039, :collate => "utf8_bin", :limit => 255
      t.string :cols1040, :collate => "utf8_bin", :limit => 255
      t.string :cols1041, :collate => "utf8_bin", :limit => 255
      t.string :cols1042, :collate => "utf8_bin", :limit => 255
      t.string :cols1043, :collate => "utf8_bin", :limit => 255
      t.string :cols1044, :collate => "utf8_bin", :limit => 255
      t.string :cols1045, :collate => "utf8_bin", :limit => 255
      t.string :cols1046, :collate => "utf8_bin", :limit => 255
      t.string :cols1047, :collate => "utf8_bin", :limit => 255
      t.string :cols1048, :collate => "utf8_bin", :limit => 255
      t.string :cols1049, :collate => "utf8_bin", :limit => 255
      t.string :cols1050, :collate => "utf8_bin", :limit => 255
      t.string :created_by, :limit => 22, :collate => "utf8_bin"
      t.string :updated_by, :limit => 22, :collate => "utf8_bin"
      t.timestamps
    end
    change_column :dip_temporary_table_50, "id", :string, :limit => 32, :collate => "utf8_bin"
    add_index(:dip_temporary_table_50, :batch_id, :name => :dip_temporary_table_50_n1)
    add_index(:dip_temporary_table_50, :template_id, :name => :dip_temporary_table_50_n2)
    add_index(:dip_temporary_table_50,[:batch_id, :target_id],:name=>:dip_temporary_table_50_n3)
  end

  def down
    drop_table :dip_temporary_table_50
  end
end
