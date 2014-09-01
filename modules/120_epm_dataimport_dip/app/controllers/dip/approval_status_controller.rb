class Dip::ApprovalStatusController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def get_data
    start=params[:start].to_i
    limit=params[:limit].to_i
    sql="SELECT t1.*, t2.\"NAME\" FROM DIP_APPROVAL_STATUSES t1,DIP_TEMPLATE t2,DIP_AUTHORITYXES t3 WHERE t1.TEMPLATE_ID = t2.\"ID\" and t3.PERSON_ID='#{Irm::Person.current.id}' and t3.FUNCTION_TYPE='TEMPLATE' and t3.\"FUNCTION\"=t2.\"ID\""
    data=Dip::ApprovalStatus.find_by_sql(Dip::Utils.paginate(sql,start,limit))
    count=Dip::Utils.get_count(sql)
    respond_to do |format|
      format.html {
        @datas = data
        @count = count
      }
    end
  end

  def view_data

  end

  def appove

  end

  def refuse

  end
end
