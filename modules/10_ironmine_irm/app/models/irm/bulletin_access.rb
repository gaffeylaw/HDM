class Irm::BulletinAccess < ActiveRecord::Base
  set_table_name :irm_bulletin_accesses

  belongs_to :irm_bulletins

  #加入activerecord的通用方法和scope
  query_extend
  # 对运维中心数据进行隔离
  default_scope {default_filter}

  scope :with_bulletin, lambda{|bulletin_id|
    where("#{table_name}.bulletin_id = ?", bulletin_id)
  }

  scope :select_all, lambda{
    select("#{table_name}.* ")
  }
end