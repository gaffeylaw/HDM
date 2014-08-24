class Irm::Attachment < ActiveRecord::Base
  set_table_name :irm_attachments

  attr_accessor :data

  has_many :attachment_versions, :dependent => :destroy

  #加入activerecord的通用方法和scope
  query_extend
  # 对运维中心数据进行隔离
  default_scope {default_filter}

  scope :list_all, lambda{
    select("#{table_name}.*, av.id version_id, av.category_id category_id, av.data_file_name data_file_name, av.data_content_type data_content_type, av.data_file_size/1024 data_file_size, av.data_updated_at data_updated_at, fvt.meaning category_name").
        select("av.source_type source_type, av.source_id source_id").
    joins(", #{Irm::AttachmentVersion.table_name} av").
    joins(", #{Irm::LookupValue.table_name} fv").
    joins(", #{Irm::LookupValuesTl.table_name} fvt").
    where("fv.id = av.category_id").
    where("fv.id = fvt.lookup_value_id").
    where("fvt.language = ?", I18n.locale).
    where("#{table_name}.latest_version_id = av.id")
  }

  scope :query_by_source, lambda{|source_type, source_id|
        where("av.id = #{table_name}.latest_version_id").
        where("av.source_type = ?", source_type).
        where("av.source_id = ?", source_id)
  }

  def last_version_entity
    self.attachment_versions.where("id = ?", self.latest_version_id).first
  end
end