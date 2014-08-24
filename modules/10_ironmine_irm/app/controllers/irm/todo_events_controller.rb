class Irm::TodoEventsController < ApplicationController
  
  def index
#    @month = (params[:month] || (Time.zone || Time).now.month).to_i
#    @year = (params[:year] || (Time.zone || Time).now.year).to_i
#
#    @shown_month = Date.civil(@year, @month)
#
#    @event_strips = Irm::CalendarTask.event_strips_for_month(@shown_month)
  end

  def quick_show
    @task = Irm::TodoEvent.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def edit
    @task = Irm::TodoEvent.find(params[:id])
    @return_url=request.env['HTTP_REFERER']
  end

  def new
    @task = Irm::TodoEvent.new
    @default_start = params[:default_start] if params[:default_start]
    #防止在新建页面, 从侧边栏又选择新建任务时,完成后又回到新建页面
    @return_url=request.env['HTTP_REFERER'] if request.env['HTTP_REFERER'] != url_for(:controller => "todo_events", :action => "new")
    respond_to do |format|
      format.html
    end
  end

  def create
    @task = Irm::TodoEvent.new(params[:irm_todo_event])

    @task.start_at = Time.now if !@task.start_at

    @task.start_at = @task.start_at.strftime("%F") + " " + params[:start_at_h]
    @task.end_at = @task.end_at.strftime("%F") + " " + params[:end_at_h]  if @task.end_at && !@task.end_at.blank?
    #如果没有填结束时间,默认当天结束
    @task.end_at = @task.start_at.strftime("%F") + " " + params[:end_at_h] if !@task.end_at || @task.end_at.blank?
    @task.calendar_id = Irm::Calendar.current_calendar(params[:assigned_to]).id
    rrule = {}
    #从星期一开始
    rrule = rrule.merge({:wkst => "MO"})
    #如果创建周期标识打开
    if params[:is_recurrence] == Irm::Constant::SYS_YES
      #如果创建周期标识打开,任务的结束日期只允许为开始日期当天
      @task.end_at = @task.start_at.strftime("%F") + " " + params[:end_at_h]

      rrule = rrule.merge({:until => DateTime.strptime(params[:recurrence_end_at], '%Y-%m-%d').strftime("%Y%m%d") + "T235959Z"})
      if params[:rectype] == "DAILY"
        #频率: 每天
        rrule = rrule.merge({:freq => "DAILY"})
        if params[:recd] == "EVERYDAY"
          #间隔: 1
          rrule = rrule.merge({:interval => "1"})
        elsif params[:recd] == "CUSTOM"
          #间隔: 用户输入
          cus_freq = params[:recurrence_daily_cus_freq]
          cus_freq = 1 if !cus_freq || cus_freq.blank?
          rrule = rrule.merge({:interval => cus_freq})
        end
      elsif params[:rectype] == "WEEKLY"
        #频率: 每星期
        rrule = rrule.merge({:freq => "WEEKLY"})
        ws = ""
        params[:recurrence_every_week].each do |w|
          ws << "," unless ws.blank?
          ws << w[1]
        end
        #指定一星期中的某天
        rrule = rrule.merge({:byday => ws})
      elsif params[:rectype] == "MONTHLY"
        #频率: 每月
        rrule = rrule.merge({:freq => "MONTHLY"})
        if params[:recm] == "DAY"
          #每几个月
          rrule = rrule.merge({:interval => params[:recurrence_on_every_month_0]})
          #第几天
          rrule = rrule.merge({:bymonthday => params[:recurrence_on_day_of_month]})
        elsif params[:recm] == "WEEK"
          #每几个月
          rrule = rrule.merge({:interval => params[:recurrence_on_every_month_1]})
          #第几个礼拜几
          rrule = rrule.merge({:byday => params[:recurrence_week_ordinal] + params[:recurrence_on_month_weekdays]})
        end
      end
    end

    @task.rrule = rrule
    @task.color = "000000"

    return_url = params[:return_url]
    respond_to do |format|
      if @task.save
        @task.copy_recurrences if params[:is_recurrence] == Irm::Constant::SYS_YES
        if return_url && !return_url.blank?
          format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @task, :status => :created, :location => @task }
        else
          format.html { redirect_to({:controller => "irm/todo_events", :action=>"my_events_index"}, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @task, :status => :created, :location => @task }
        end

      else
        format.html { render ({:action=>"new"})}
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @task = Irm::TodoEvent.find(params[:id])

    start_at = params[:irm_todo_event][:start_at] + " " + params[:start_at_h]
    end_at = params[:irm_todo_event][:end_at] + " " + params[:end_at_h] if params[:irm_todo_event][:end_at] && !params[:irm_todo_event][:end_at].blank?
    end_at = params[:irm_todo_event][:start_at] + " " + params[:end_at_h] if !params[:irm_todo_event][:end_at] || params[:irm_todo_event][:end_at].blank?
    calendar_id = Irm::Calendar.current_calendar(params[:assigned_to]).id
    return_url = params[:return_url]
    respond_to do |format|
      if @task.update_attributes(params[:irm_todo_event]) &&
        @task.update_attributes(:start_at => start_at, :end_at => end_at, :calendar_id => calendar_id)
        if return_url && !return_url.blank?
          format.html { redirect_to(return_url, :notice =>t(:successfully_created)) }
          format.xml  { render :xml => @task, :status => :created, :location => @task }
        else
          format.html { redirect_to({:controller => "irm/todo_events", :action=>"my_events_index"}, :notice => t(:successfully_updated)) }
          format.xml  { head :ok }
        end
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  def show
    @task = Irm::TodoEvent.with_all.with_event_status.with_calendar.with_priority.where("#{Irm::TodoEvent.table_name}.id = ?", params[:id]).first
  end

  def edit_recurrence
    @task = Irm::TodoEvent.find(params[:id])
  end

  def update_recurrence
    rrule = {}
    #从星期一开始
    rrule = rrule.merge({:wkst => "MO"})
    rrule = rrule.merge({:until => DateTime.strptime(params[:recurrence_end_at], '%Y-%m-%d').strftime("%Y%m%d") + "T235959Z"})
    if params[:rectype] == "DAILY"
      #频率: 每天
      rrule = rrule.merge({:freq => "DAILY"})
      if params[:recd] == "EVERYDAY"
        #间隔: 1
        rrule = rrule.merge({:interval => "1"})
      elsif params[:recd] == "CUSTOM"
        #间隔: 用户输入
        cus_freq = params[:recurrence_daily_cus_freq]
        cus_freq = 1 if !cus_freq || cus_freq.blank?
        rrule = rrule.merge({:interval => cus_freq})
      end
    elsif params[:rectype] == "WEEKLY"
      #频率: 每星期
      rrule = rrule.merge({:freq => "WEEKLY"})
      ws = ""
      params[:recurrence_every_week].each do |w|
        ws << "," unless ws.blank?
        ws << w[1]
      end
      #指定一星期中的某天
      rrule = rrule.merge({:byday => ws})
    elsif params[:rectype] == "MONTHLY"
      #频率: 每月
      rrule = rrule.merge({:freq => "MONTHLY"})
      if params[:recm] == "DAY"
        #每几个月
        rrule = rrule.merge({:interval => params[:recurrence_on_every_month_0]})
        #第几天
        rrule = rrule.merge({:bymonthday => params[:recurrence_on_day_of_month]})
      elsif params[:recm] == "WEEK"
        #每几个月
        rrule = rrule.merge({:interval => params[:recurrence_on_every_month_1]})
        #第几个礼拜几
        rrule = rrule.merge({:byday => params[:recurrence_week_ordinal] + params[:recurrence_on_month_weekdays]})
      end
    end
    @task = Irm::TodoEvent.find(params[:id])
#    if @task.parent_id && !@task.parent_id.blank?
#      tasks = Irm::WfTask.where(:id => @task.parent_id)
#    else
#      tasks = Irm::WfTask.where(:parent_id => @task.id)
#    end

    respond_to do |format|
      if @task.update_attributes(:rrule => rrule)
        #删除当前任务所设置的开始时间之后,尚未发生的任务
        @task.delete_recurrences
        #以这个任务为基准,重新计算之后的循环任务
        @task.copy_recurrences

        format.html { redirect_to({:controller => "irm/todo_events", :action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end

  end

  def get_data
    tasks_scope = Irm::TodoEvent.with_all.with_event_status.with_priority.uncompleted.with_calendar.assigned_to(Irm::Person.current.id)

    tasks,count = paginate(tasks_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(tasks.to_grid_json([:name,:start_at,:end_at,:color,:status_code, :assigned_name, :priority_name, :event_status_name], count)) }
    end
  end

  def get_top_data
    tasks_scope = Irm::TodoEvent.with_all.with_event_status.with_priority.uncompleted.with_calendar.assigned_to(Irm::Person.current.id).where("start_at >= ?", DateTime.strptime(Time.now.strftime("%F"), "%F"))

    tasks,count = paginate(tasks_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(tasks.to_grid_json([:name,:start_at,:end_at,:color,:status_code, :assigned_name, :priority_name, :event_status_name], count)) }
    end
  end

  def my_events_index

  end

  def my_events_get_data
    my_tasks_scope = Irm::TodoEvent.with_all.with_event_status.with_priority.uncompleted.with_calendar.assigned_to(Irm::Person.current.id)
    my_tasks,count = paginate(my_tasks_scope)
    respond_to do |format|
      format.json {render :json => to_jsonp(my_tasks.to_grid_json([:name,:start_at,:end_at,:color,:status_code, :priority_name, :event_status_name], count))}
    end
  end

  def calendar_view
    @month = (params[:month] || (Time.zone || Time).now.month).to_i
    @year = (params[:year] || (Time.zone || Time).now.year).to_i

    @shown_month = Date.civil(@year, @month)

    @event_strips = Irm::TodoEvent.event_strips_for_month(@shown_month, Irm::Calendar.current_calendar(Irm::Person.current.id))
  end
  
end
