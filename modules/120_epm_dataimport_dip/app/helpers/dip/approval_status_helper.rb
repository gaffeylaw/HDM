module Dip::ApprovalStatusHelper
  def get_combination(templateId,combination_record)
    template=Dip::Template.where({:id=>templateId}).first
    if(template[:combination_id])
      combination=Dip::Combination.where({:id=>template[:combination_id]}).first
      combinationRecord=Dip::CommonModel.find_by_sql("select * from #{combination[:code].to_s.upcase} t where t.combination_record='#{combination_record}'").first
      str=[]

      Dip::Header.find_by_sql("select t1.CODE,t1.\"ID\" from DIP_HEADER t1,DIP_COMBINATION_HEADERS t2 where t2.COMBINATION_ID='#{combination[:id]}' and t2.HEADER_ID=t1.\"ID\" order by t2.HEADER_ID").each do |h|
        str<<combinationRecord["#{h[:code].to_s.downcase}_v"]
      end
      str.join("-")
    else
      " "
    end
  end

end
