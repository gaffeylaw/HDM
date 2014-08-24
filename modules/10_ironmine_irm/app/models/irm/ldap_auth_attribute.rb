class Irm::LdapAuthAttribute < ActiveRecord::Base
  set_table_name :irm_ldap_auth_attributes
  belongs_to :ldap_auth_header,:foreign_key=>:ldap_auth_header_id,:primary_key=>:id

  validates_presence_of :ldap_auth_header_id, :local_attr, :ldap_attr
  #加入activerecord的通用方法和scope
  query_extend
  # 对运维中心数据进行隔离
  default_scope {default_filter}
end
