class CreateDipValues < ActiveRecord::Migration
  def change
    create_table :dip_values do |t|
      t.string :value_set_code,:limit=>100,:nil=>false
      t.string :value_code,:limit=>100,:nil=>false
      t.string :value,:limit=>100,:nil=>false
      t.string :created_by, :limit => 22
      t.string :updated_by, :limit => 22
      t.string :combination_record,:limit=>22
      t.string :batch_id,:limit=>32
      t.integer :idx
      t.timestamps
    end
    execute %{alter table DIP_VALUES drop column id}
    execute %{create or replace view dip_values_v as select t.rowid row_id,t.* from dip_values t }
  end

end
