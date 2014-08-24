module Irm::WfApprovalStepsHelper
  def available_wf_step_evaluate_result
    Irm::LookupValue.query_by_lookup_type("WF_STEP_EVALUATE_RESUTL").multilingual.order_id.collect{|p|[p[:meaning],p[:lookup_code]]}
  end


  def step_approver_value(step_id)
    if step_id
      return Irm::WfApprovalStepApprover.where(:step_id=>step_id).collect{|as| "#{as.approver_type}##{as.approver_id}"}.join(",")
    end
  end

  def available_step_approver(bo_code)
    values = []
    values +=Irm::Person.real.collect{|p| ["#{Irm::BusinessObject.class_name_to_meaning(Irm::Person.name)}:#{p.full_name}","PERSON##{p.id}",{:type=>"PERSON",:query=>p.full_name}]}
    values +=Irm::Role.multilingual.enabled.collect{|r| ["#{Irm::BusinessObject.class_name_to_meaning(Irm::Role.name)}:#{r[:name]}","ROLE##{r.id}",{:type=>"ROLE",:query=>r[:name]}]}
    if bo_code
      values += Irm::ObjectAttribute.person_column.enabled.multilingual.query_by_business_object_code(bo_code).collect{|o| ["#{t(:label_related_person)}:#{o[:name]}","RELATED_PERSON##{o.attribute_name}",{:type=>"RELATED_PERSON",:query=>o[:name]}]}
    end
    values
  end


  def step_evaluate_mode_meaning(step)
    if step.evaluate_mode.present?
       case step.evaluate_mode
         when "FILTER"
           rule_filter = Irm::RuleFilter.query_by_source(Irm::WfApprovalStep.name,step.id).first
           return "#{rule_filter.meaning},#{t(:else)} <b>#{step[:evaluate_result_name]}</b>".html_safe
       end
    end

  end

  def step_approver_meaning(step,bo_duel_value)
    if step.approver_mode.present?
      case step.approver_mode
        when "SELECT_BY_SUMBITTER"
          return step[:approver_mode_name]
        when "PROCESS_DEFAULT"
          oa = Irm::ObjectAttribute.multilingual.query_by_business_object_code("IRM_PEOPLE").where(:attribute_name=>Irm::WfApprovalProcess.query_by_step(step.id).first.next_approver_mode).first
          approver_name = oa[:name] if oa
        when "AUTO_APPROVER"
          meaning = duel_meaning(step.get_approver_str,bo_duel_value)
          label = meaning.join(",</br>")
          return "<b>#{step[:multiple_approver_mode_name]}</b></br> #{label}".html_safe
      end
    end
  end
end
