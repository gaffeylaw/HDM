class Irm::WfRule < ActiveRecord::Base
  set_table_name :irm_wf_rules

  attr_accessor :step

  validates_presence_of :bo_code,:if=>Proc.new{|i| i.check_step(1)}
  validates_presence_of :name,:rule_code,:if=>Proc.new{|i| i.check_step(2)}
  validates_format_of :rule_code, :with => /^[A-Z0-9_]*$/ ,:if=>Proc.new{|i| !i.rule_code.blank?},:message=>:code

  #加入activerecord的通用方法和scope
  query_extend
  # 对运维中心数据进行隔离
  default_scope {default_filter}

  has_many :wf_rule_time_triggers,:foreign_key => :rule_id

  scope :with_evaluate_criteria_rule,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} evaluate_criteria_rule ON evaluate_criteria_rule.lookup_type='WORKFLOW_RULE_EVALUATE_TYPE' AND evaluate_criteria_rule.lookup_code = #{table_name}.evaluate_criteria_rule AND evaluate_criteria_rule.language= '#{language}'").
    select(" evaluate_criteria_rule.meaning evaluate_criteria_rule_name")
  }

  scope :with_evaluate_criteria_mode,lambda{|language|
    joins("LEFT OUTER JOIN #{Irm::LookupValue.view_name} evaluate_rule_mode ON evaluate_rule_mode.lookup_type='WORKFLOW_RULE_EVALUATE_MODE' AND evaluate_rule_mode.lookup_code = #{table_name}.evaluate_rule_mode AND evaluate_rule_mode.language= '#{language}'").
    select(" evaluate_rule_mode.meaning evaluate_rule_mode_name")
  }

  scope :with_bo,lambda{|language|
    joins("JOIN #{Irm::BusinessObject.view_name} ON #{Irm::BusinessObject.view_name}.business_object_code = #{table_name}.bo_code AND #{Irm::BusinessObject.view_name}.language ='#{language}'").
    select("#{Irm::BusinessObject.view_name}.name bo_name")
  }

  scope :not_applied_before,lambda{|bo_id|
    where("NOT EXISTS(SELECT 1 FROM #{Irm::WfRuleHistory.table_name} WHERE #{Irm::WfRuleHistory.table_name}.rule_id=#{table_name}.id AND #{Irm::WfRuleHistory.table_name}.bo_code=#{table_name}.bo_code AND #{Irm::WfRuleHistory.table_name}.bo_id=?)",bo_id)
  }

  scope :create_edit_first_time,lambda{where(:evaluate_criteria_rule=>"CREATE_EDIT_FIRST_TIME")}

  scope :only_create,lambda{where(:evaluate_criteria_rule=>"ONLY_CREATE")}

  scope :create_edit_every_time,lambda{where(:evaluate_criteria_rule=>"CREATE_EDIT_EVERY_TIME")}

  scope :query_by_action,lambda{|action_type,action_id|
    joins("JOIN #{Irm::WfRuleAction.table_name} action ON action.rule_id = #{table_name}.id ").
    where("action.action_type = ? AND action.action_reference_id = ?",action_type,action_id)
  }

  def self.select_all
    select("#{table_name}.*")
  end

  def self.list_all
    select("#{table_name}.*").with_bo(I18n.locale).with_evaluate_criteria_rule(I18n.locale).with_evaluate_criteria_mode(I18n.locale)
  end



  def check_step(stp)
    self.step.nil?||self.step.to_i>=stp
  end

  # is the event match the filter or formula ?
  def match(event)
    rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,self.id).first
    business_object = rule_filter.generate_scope.where(:id=>event.business_object_id).first
    business_object
  end
  # apply the workflow
  def apply(business_object)
    immediate_actions  = Irm::WfRuleAction.where(:rule_id=>self.id,:time_trigger_id=>nil)
    immediate_actions.each do |action|
      Delayed::Job.enqueue(Irm::Jobs::ActionProcessJob.new({:bo_id=>business_object.id,:bo_code=>self.bo_code,:action_id=>action.action_reference_id,:action_type=>action.action_type}))
    end

    self.wf_rule_time_triggers.each do |time_trigger|
      time_actions  = Irm::WfRuleAction.where(:rule_id=>self.id,:time_trigger_id=>time_trigger)
      time_actions.each do |action|
        Delayed::Job.enqueue(Irm::Jobs::ActionProcessJob.new({:bo_id=>business_object.id,:bo_code=>self.bo_code,:action_id=>action.action_reference_id,:action_type=>action.action_type}),0,time_trigger.date_time(business_object))
      end
    end
  end

end
