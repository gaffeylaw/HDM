class Dip::ApprovalStatusController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end
  def manage
    respond_to do |format|
      format.html
    end
  end

  def get_data
    start=params[:start].to_i
    limit=params[:limit].to_i
    sql=%{
SELECT
	t1.*,t6."NAME"
FROM
	DIP_APPROVAL_STATUSES t1,
	(
		SELECT t2.COMBINATION_RECORD_ID,
			COUNT (1) "CT1"
		FROM
			DIP_COMBINATION_ITEMS t2,
			DIP_AUTHORITYXES t3
		WHERE t2.HEADER_VALUE_ID = t3."FUNCTION"
		AND t3.FUNCTION_TYPE = 'VALUE'
		AND t3.PERSON_ID = '#{Irm::Person.current.id}'
		group by t2.COMBINATION_RECORD_ID
	) t4,
	(
		SELECT T.combination_record_id,
			COUNT (1) "CT2"
		FROM
			DIP_COMBINATION_ITEMS T
		group by t.combination_record_id
	) t5,
	DIP_TEMPLATE  t6,
	DIP_AUTHORITYXES t7
WHERE t1.combination_record=t4.combination_record_ID
and t4.combination_record_ID=t5.combination_record_ID
and t4."CT1"=T5."CT2"
and t6."ID"=t1.TEMPLATE_ID
and t7.FUNCTION_TYPE='TEMPLATE'
and t7."FUNCTION"=t1.TEMPLATE_ID
and t7.PERSON_ID='#{Irm::Person.current.id}'


}
    data=Dip::ApprovalStatus.find_by_sql(Dip::Utils.paginate(sql,start,limit))
    count=Dip::Utils.get_count(sql)
    respond_to do |format|
      format.html {
        @datas = data
        @count = count
      }
    end
    end

  def get_manage_data
    start=params[:start].to_i
    limit=params[:limit].to_i
    sql=%{SELECT
	t1.*,t6."NAME"
FROM
	DIP_APPROVAL_STATUSES t1,
	(
		SELECT t2.COMBINATION_RECORD_ID,
			COUNT (1) "CT1"
		FROM
			DIP_COMBINATION_ITEMS t2,
			DIP_AUTHORITYXES t3
		WHERE t2.HEADER_VALUE_ID = t3."FUNCTION"
		AND t3.FUNCTION_TYPE = 'VALUE'
		AND t3.PERSON_ID = '#{Irm::Person.current.id}'
		group by t2.COMBINATION_RECORD_ID
	) t4,
	(
		SELECT T.combination_record_id,
			COUNT (1) "CT2"
		FROM
			DIP_COMBINATION_ITEMS T
		group by t.combination_record_id
	) t5,
	DIP_TEMPLATE  t6
WHERE t1.combination_record=t4.combination_record_ID
and t4.combination_record_ID=t5.combination_record_ID
and t4."CT1"=T5."CT2"
and t6."ID"=t1.TEMPLATE_ID}
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
