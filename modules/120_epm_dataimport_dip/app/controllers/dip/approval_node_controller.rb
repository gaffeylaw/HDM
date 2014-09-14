class Dip::ApprovalNodeController < ApplicationController
  layout "bootstrap_application_full"
  def get_data
    start=params[:start].to_i
    limit=params[:limit].to_i
    sql="select t1.*,t2.\"NAME\" from DIP_APPROVAL_NODES t1,DIP_TEMPLATE t2 where t1.template_id=t2.id and t1.APPROVER='#{Irm::Person.current.id}' and t1.APPROVE_STATUS is null"
    data=Dip::ApprovalNode.find_by_sql(Dip::Utils.paginate(sql,start,limit))
    count=Dip::Utils.get_count(sql)
    respond_to do |format|
      format.html {
        @datas1 = data
        @count1 = count
      }
    end
  end

  def approval_agree
    nodeId=params[:nodeId]
    node=Dip::ApprovalNode.where({:id=>nodeId}).first
    node.update_attributes({:approve_status=>"AGREE"})
    ActiveRecord::Base.connection().execute("delete from DIP_APPROVAL_NODES t where t.combination_record='#{node[:combination_record]}' "+
    " and t.template_id='#{node[:template_id]}' and t.approve_status is null")
    plsql.hdm_common_approval.generate_node(:personid=>Irm::Person.current.id,
                                            :templateid=>node[:template_id],
                                            :combinationrecord=>node[:combination_record],
                                            :icommiter=>node[:icommiter],
                                            :cur_node_id=>nodeId)
    respond_to do |format|
      format.json {
        render :json => ""
      }
    end
  end

  def approval_reject
    nodeId=params[:nodeId]
    node=Dip::ApprovalNode.where({:id=>nodeId}).first
    node.update_attributes({:approve_status=>"REJECT"})
    ActiveRecord::Base.connection().execute("delete from DIP_APPROVAL_NODES t where t.combination_record='#{node[:combination_record]}' "+
                                                " and t.template_id='#{node[:template_id]}' and t.approve_status is null")
    Dip::ApprovalStatus.where({:template_id=>node[:template_id],:combination_record=>node[:combination_record]}).first.update_attributes({:approval_status=>"REJECT"})
    respond_to do |format|
      format.json {
        render :json => ""
      }
    end
  end

  def approval_reset
    statusId=params[:statusId]
    approvalStatus=Dip::ApprovalStatus.where({:id=>statusId}).first
    approvalStatus.destroy
    Dip::ApprovalNode.where({:combination_record=>approvalStatus[:combination_record],
                             :template_id=>approvalStatus[:template_id]}).each do|d|
      d.destroy
    end
    respond_to do |format|
      format.json {
        render :json => ""
      }
    end
  end
end
