module Irm::WfProcessInstancesHelper
  def process_instance_button(bo_id,bo_model_name)
    submitted_process_instance = Irm::WfProcessInstance.list_all.where(:bo_id=>bo_id,:bo_model_name=>bo_model_name,:process_status_code=>"SUBMITTED").first
    links = ""
    if  submitted_process_instance
      process = Irm::WfApprovalProcess.query(submitted_process_instance.process_id).first
      if(process.allow_submitter_recall.eql?(Irm::Constant::SYS_YES)&&current_person?(submitted_process_instance.submitter_id))
        links << link_to(t(:label_irm_wf_process_instance_recall),{:controller => "irm/wf_process_instances",:action=>"recall",:id=>submitted_process_instance.id,:back_url=>url_for({})},:class=>"btn")
      end
    else
      links << link_to(t(:label_irm_wf_process_instance_submit),{:controller => "irm/wf_process_instances",:action=>"submit",:bo_id=>bo_id,:bo_model_name=>bo_model_name,:back_url=>url_for({})},:class=>"btn")
    end
    links.html_safe
  end


  def approval_history(bo_id,bo_model_name)
    return unless allow_to_function?(:workflow_approval)
    process_instances = Irm::WfProcessInstance.list_all.where(:bo_id=>bo_id,:bo_model_name=>bo_model_name).order("created_at desc")
    process_infos = []
    process_instances.each{|pi| process_infos<<process_instance_history(pi)}
    render :partial=>"irm/wf_process_instances/process_history",:locals=>{:process_infos=>process_infos,:bo_id=>bo_id,:bo_model_name=>bo_model_name}
  end

  def process_instance_history(pi)
    options = {:process_instance=>pi}

    options[:step_infos]=step_instance_history(pi)
    options
  end

  def step_instance_history(pi)
    valid_approval_code = ["PENDING","APPROVED","REJECT","MULTIPLE_APPROVED","MULTIPLE_REJECT","REASSIGN","RECALL"]
    steps = Irm::WfApprovalStep.list_all.where(:process_id=>pi.process_id)
    step_instances = Irm::WfStepInstance.list_all.where(:process_instance_id=>pi.id).where("approval_status_code in (?)",valid_approval_code).order("created_at desc,end_at")
    step_infos = []
    step_instances.group_by{|i| i.batch_id}.each do |batch_id,instances|
      current_step = steps.detect{|i| i.id.eql?(instances.first.step_id)}
      step_name = current_step.name
      if(current_step.approver_mode.eql?("AUTO_APPROVER"))
        step_name+="(#{current_step[:multiple_approver_mode_name]})"
      end
      step_infos << {:step=>{:id=>current_step.id,:name=>step_name,:status=>"PENDING",:step_number=>current_step.step_number},:step_instances=>instances}
    end
    step_infos
  end

  def step_status(status)

  end

  def process_status(status_code)
    status_code
  end

  def operations_for(step_instance)
    if(step_instance.approval_status_code.eql?("PENDING")&&(current_person?(step_instance.assign_approver_id)||(Irm::Constant::SYS_YES.eql?(step_instance[:allow_delegation_approve])&&current_person?(step_instance[:delegate_approver]))))
      links = ""
      links << link_to(t(:label_irm_wf_step_instance_reassign),{:controller => "irm/wf_step_instances",:action=>"reassign",:id=>step_instance.id,:back_url=>url_for({})})
      links << "  "
      links << link_to(t(:label_irm_wf_step_instance_approve_or_reject),{:controller => "irm/wf_step_instances",:action=>"show",:id=>step_instance.id,:back_url=>url_for({})})
      links.html_safe
    end
  end


  def step_instance_description(step_instance)
    if step_instance[:bo_id]&&step_instance[:bo_model_name]&&step_instance[:bo_description]
      url_options = step_instance[:bo_model_name].constantize.urlable_url_options(:show,{:id=>step_instance[:bo_id]})
      return link_to(step_instance[:bo_description],url_options).html_safe
    end
  end

  def process_instance_relation_bo_link(process_instance)
    if process_instance[:bo_id]&&process_instance[:bo_model_name]&&process_instance[:bo_description]
      url_options = process_instance[:bo_model_name].constantize.urlable_url_options(:show,{:id=>process_instance[:bo_id]})
      return link_to(process_instance[:bo_description],url_options).html_safe
    end
  end

  def my_approvals
    output = ActiveSupport::SafeBuffer.new
    step_instances = Irm::WfStepInstance.select_all.with_assign_approver.with_step.with_process_instance(I18n.locale).by_person(Irm::Person.current).where(:approval_status_code=>"PENDING")
    change_approvals = Chm::ChangeApproval.select_all.where(:person_id=>Irm::Person.current.id,:approve_status=>"APPROVING").with_change_request
    output << render(:partial=>"irm/wf_process_instances/my_approvals",:locals=>{:step_instances=>step_instances,:personal_change_approvals=>change_approvals})
  end
end
