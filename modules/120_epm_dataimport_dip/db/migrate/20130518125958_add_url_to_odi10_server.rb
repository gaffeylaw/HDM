class AddUrlToOdi10Server < ActiveRecord::Migration
  def up
    add_column :dip_odi10_servers, :service_url, :string, :limit => 300
  end

  def down
    remove_column :dip_odi10_servers, :service_url
  end
end
