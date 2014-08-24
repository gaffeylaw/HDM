class Irm::Lane < ActiveRecord::Base
  set_table_name :irm_lanes
  attr_accessor :name,:description
  has_many :lanes_tls, :dependent => :destroy
  acts_as_multilingual

  has_many :kanban_lanes,:dependent => :destroy
  has_many :kanbans, :through => :kanban_lanes
  has_many :lane_cards
  has_many :cards, :through => :lane_cards

  #加入activerecord的通用方法和scope
  query_extend
  # 对运维中心数据进行隔离
  default_scope {default_filter}

  validates_presence_of :lane_code
  validates_uniqueness_of :lane_code ,:scope=>[:opu_id]

  scope :without_kanban, lambda{|kanban_id|
    joins(",#{Irm::LanesTl.table_name} lt ").
        where("lt.lane_id = #{table_name}.id").
        where("lt.language = ?", I18n.locale).
        where("NOT EXISTS(SELECT 1 FROM #{Irm::KanbanLane.table_name} kl WHERE kl.kanban_id = ? AND kl.lane_id = #{table_name}.id)", kanban_id).
        select("lt.name lane_name, lt.description lane_description")
  }

  scope :select_all, lambda{
    select("#{table_name}.*")
  }

  scope :with_cards, lambda{|lane_id|
    joins(",#{Irm::Card.table_name} c, #{Irm::CardsTl.table_name} ct, #{Irm::LaneCard.table_name} lc").
        where("c.id = lc.card_id").
        where("c.id = ct.card_id").
        where("#{table_name}.id = ?", lane_id).
        where("lc.lane_id = #{table_name}.id").
        where("ct.language = ?", I18n.locale).
        where("c.status_code = ?", Irm::Constant::ENABLED).
        select("c.card_code card_code, ct.name card_name, ct.description card_description, c.background_color background_color, c.id irm_card_id")

  }

  scope :query_by_kanban, lambda{|kanban_id|
    joins(",#{Irm::KanbanLane.table_name} kl").
        where("kl.kanban_id = ?", kanban_id).
        where("kl.lane_id = #{table_name}.id")
  }

  scope :with_sequence, lambda{
    order("kl.display_sequence ASC")
  }

  scope :query_by_profile_position, lambda{|profile_id, position_code|
    joins(",#{Irm::ProfileLane.table_name} pl,#{Irm::ProfileKanban.table_name} pk").
        where("pk.profile_id = ?", profile_id).
        where("pk.id = pl.profile_kanban_id").
        where("pl.lane_id = #{table_name}.id").
        where("pk.position_code=?", position_code).order("pl.display_sequence ASC")
  }
end