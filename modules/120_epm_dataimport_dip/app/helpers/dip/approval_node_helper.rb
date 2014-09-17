module Dip::ApprovalNodeHelper
  def get_approve_path(template_id,combination_record)
    html=t(:label_yourself)
    html << get_approval_path_sub(template_id,combination_record,nil)
  end
  private
  def get_approval_path_sub(template_id,combination_record,p_node)
    sql=""
    if p_node.nil?
      sql=%{select t1.*,t2.FULL_NAME from DIP_APPROVAL_NODES t1,IRM_PEOPLE t2
            where t1.TEMPLATE_ID='#{template_id}'
            and t1.COMBINATION_RECORD='#{combination_record}'
            and t1.PARENT_NODE is null
            and t1.APPROVER=t2."ID"}
    else
      sql=%{select t1.*,t2.FULL_NAME from DIP_APPROVAL_NODES t1,IRM_PEOPLE t2
            where t1.TEMPLATE_ID='#{template_id}'
            and t1.COMBINATION_RECORD='#{combination_record}'
            and t1.PARENT_NODE='#{p_node}'
            and t1.APPROVER=t2."ID"}
    end
    res=Dip::CommonModel.find_by_sql(sql).first
    if res
      "->#{res[:full_name]}#{get_approval_path_sub(template_id,combination_record,res[:id])}"
    else
      ""
    end
  end
end
