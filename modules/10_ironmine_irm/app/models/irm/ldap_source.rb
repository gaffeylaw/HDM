require 'net/ldap'
class Irm::LdapSource < ActiveRecord::Base
  set_table_name :irm_ldap_sources

  #多个帐号使用同一个认证源认证
  has_many :ldap_auth_attribute

  validates_presence_of :name, :host, :port, :base_dn

  validates_length_of :name, :maximum => 60
  validates_length_of :host, :maximum => 60
  validates_length_of :base_dn, :maximum => 255
  validates_uniqueness_of :name, :scope => :opu_id, :if => Proc.new { |i| !i.name.blank? }

  #加入activerecord的通用方法和scope
  query_extend
  # 对运维中心数据进行隔离
  default_scope { default_filter }

  def self.enabled?(id)
    ldap_sources = self.where("id=? AND status_code=?", id, Irm::Constant::ENABLED)
    if ldap_sources.any?
      return true
    else
      return false
    end
  end

  def anonymous?
    !self.account.present?||!self.account_password.present?
  end

  def auth_options
    if anonymous?
      {:method => :anonymous}
    else
      {:method => :simple, :username => self.account, :password => self.account_password}
    end
  end

  def ldap
    ldap = self.initialize_ldap_con(self.account, self.account_password)
    ldap
  end

  def initialize_ldap_con(ldap_user, ldap_password)
    options = {:host => self.host,
               :port => self.port
    }
    options.merge!(:auth => {:method => :simple, :username => ldap_user, :password => ldap_password}) unless ldap_user.blank? && ldap_password.blank?
    Net::LDAP.new options
  end

  # 测试LDAP连接
  def test_connection
    ldap = Net::LDAP.new
    ldap.host = self.host
    ldap.port = self.port


    object_filter = Net::LDAP::Filter.eq("objectClass", "*")
    login_filter = Net::LDAP::Filter.eq( "employeeNumber", "none" )

    ldap.search(:auth => auth_options,
                :base => self.base_dn,
                :filter => object_filter&login_filter,
                :attributes => (['dn']))
    return "The connection was authenticated successfully"
  rescue Net::LDAP::LdapError => text
    return "The connection was authenticated failed"
  end

end
