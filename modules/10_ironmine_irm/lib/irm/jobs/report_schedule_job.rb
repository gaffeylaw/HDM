module Irm
  module Jobs
    class ReportScheduleJob<Struct.new(:report_schedule_id)
      def perform
        Irm::Person.current = Irm::Person.anonymous
        report_schedule = Irm::ReportSchedule.unscoped.where(:id => report_schedule_id,:run_status=>"PENDING").first
        if(report_schedule)
          begin
            start_time = Time.now
            report_schedule.update_attribute(:run_status,"RUNNING")
            report_trigger = report_schedule.report_trigger
            Irm::Person.current = Irm::Person.find(report_trigger.person_id)
            ::I18n.locale = Irm::Person.current.language_code
            report = report_trigger.report

            if report.filter_date_range_type.present? and !report.filter_date_range_type.to_s.eql?('CUSTOM')
              from_and_to = Irm::ConvertTime.convert(report.filter_date_range_type)
              report.filter_date_from = from_and_to[:from]
              report.filter_date_to = from_and_to[:to]
            end
            to_people = Irm::Person.query_by_ids(report_trigger.receiver_person_ids)
            to_mails = to_people.collect{|p| p.email_address if Irm::Constant::SYS_YES.eql?(p.notification_flag)}.compact.join(",")
            ReportMailer.report_email(report.id,report_schedule.id,{:to=>to_mails}).deliver
            report_schedule.update_attribute(:run_status,"DONE")
            end_time = Time.now

            #记录报表运行历史
            report_params = report.program_params.merge({:date_from=>report.filter_date_from,:date_to=>report.filter_date_to})
            report_history = Irm::ReportRequestHistory.create(:report_id=>report.id,:executed_by=>Irm::Person.anonymous.id,:trigger_id=>report_trigger.id,:start_at=>start_time,:end_at=>end_time,:execute_type=>"MAIL",:params=>report_params)
          end
        end
      end
    end
  end
end