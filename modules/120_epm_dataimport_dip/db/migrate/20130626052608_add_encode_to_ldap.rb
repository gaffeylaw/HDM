class AddEncodeToLdap < ActiveRecord::Migration
  def up
    add_column :irm_ldap_sources, :encoding, :string, :limit => 32, :default => "UTF-8"
  end

  def down
    remove_column :irm_ldap_sources, :encoding
  end
end
