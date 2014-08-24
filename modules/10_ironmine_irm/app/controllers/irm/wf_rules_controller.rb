class Irm::WfRulesController < ApplicationController
  # GET /wf_rules
  # GET /wf_rules.xml
  def index
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @wf_rules }
    end
  end

  # GET /wf_rules/1
  # GET /wf_rules/1.xml
  def show
    @wf_rule = Irm::WfRule.list_all.find(params[:id])
    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,@wf_rule.id).first

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @wf_rule }
    end
  end

  # GET /wf_rules/new
  # GET /wf_rules/new.xml
  def new
    if params[:irm_wf_rule]
      session[:irm_wf_rule].merge!(params[:irm_wf_rule].symbolize_keys)
    else
      session[:irm_wf_rule]={:step=>1}
      session[:irm_rule_filter] = nil
    end
    @wf_rule = Irm::WfRule.new(session[:irm_wf_rule])
    @wf_rule.step = @wf_rule.step.to_i if  @wf_rule.step.present?

    validate_result = request.post?&&@wf_rule.valid?

    if request.post?&&@wf_rule.step.eql?(2)
      session[:irm_rule_filter] = params[:irm_rule_filter]
      @rule_filter = Irm::RuleFilter.new(session[:irm_rule_filter])
      validate_result = validate_result&&@rule_filter.valid?
    end

    if validate_result
      if(params[:pre_step]&&@wf_rule.step.to_i>1)
        @wf_rule.step = @wf_rule.step.to_i-1
        session[:irm_wf_rule][:step] = @wf_rule.step
      else
        if @wf_rule.step<2
          @wf_rule.step = @wf_rule.step.to_i+1
          session[:irm_wf_rule][:step] = @wf_rule.step
        end
      end
    end

    if @wf_rule.step.eql?(2)
      @wf_rule.evaluate_criteria_rule||= "CREATE_EDIT_FIRST_TIME"
      if session[:irm_rule_filter]
        @rule_filter ||=Irm::RuleFilter.new(session[:irm_rule_filter])
      else
        @rule_filter ||=Irm::RuleFilter.create_for_source(@wf_rule.bo_code,Irm::WfRule.name,0)
      end
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report_type }
    end

  end

  # GET /wf_rules/1/edit
  def edit
    @wf_rule = Irm::WfRule.find(params[:id])
    if @wf_rule.enabled?
      respond_to do |format|
        format.html { redirect_to({:action => "show", :id => @wf_rule.id})}
      end
    end
    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,@wf_rule.id).first
  end

  # POST /wf_rules
  # POST /wf_rules.xml
  def create
    session[:irm_rule_filter] = params[:irm_rule_filter]
    session[:irm_wf_rule].merge!(params[:irm_wf_rule])
    @wf_rule = Irm::WfRule.new(session[:irm_wf_rule])
    @rule_filter =Irm::RuleFilter.new(session[:irm_rule_filter])

    respond_to do |format|
      if @wf_rule.valid?&&@rule_filter.valid?
         @wf_rule.save
         @rule_filter.source_id = @wf_rule.id
         @rule_filter.save
         session[:irm_rule_filter] = nil
         session[:irm_wf_rule] = nil
        format.html { redirect_to({:action => "show",:id=>@wf_rule.id}, :notice => t(:successfully_created)) }
        format.xml  { render :xml => @wf_rule, :status => :created, :location => @wf_rule }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @wf_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /wf_rules/1
  # PUT /wf_rules/1.xml
  def update
    @wf_rule = Irm::WfRule.find(params[:id])
    @rule_filter = Irm::RuleFilter.query_by_source(Irm::WfRule.name,@wf_rule.id).first

    respond_to do |format|
      if @wf_rule.update_attributes(params[:irm_wf_rule])&&@rule_filter.update_attributes(params[:irm_rule_filter])
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @wf_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /wf_rules/1
  # DELETE /wf_rules/1.xml
  def destroy
    @wf_rule = Irm::WfRule.find(params[:id])
    @wf_rule.destroy

    respond_to do |format|
      format.html { redirect_to(wf_rules_url) }
      format.xml  { head :ok }
    end
  end

  def destroy_action
    @wf_rule_action = Irm::WfRuleAction.find(params[:id]);
    @wf_rule_action.destroy

    respond_to do |format|
      format.html { redirect_back_or_default({:action=>"show",:id=>params[:id]})
 }
      format.xml  { head :ok }
    end
  end

  def active
    @wf_rule = Irm::WfRule.find(params[:id])
    attrs = {}
    if(Irm::Constant::SYS_YES.eql?(params[:active]))
      attrs =  {:status_code=>"ENABLED"}
    else
      attrs =  {:status_code=>"OFFLINE"}
    end

    respond_to do |format|
      if @wf_rule.update_attributes(attrs)
        format.html { redirect_to({:action=>"show",:id=>@wf_rule.id}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { redirect_to({:action=>"show",:id=>@wf_rule.id}) }
        format.xml  { render :xml => @wf_rule.errors, :status => :unprocessable_entity }
      end
    end
  end

  def get_data
    wf_rules_scope = Irm::WfRule.list_all.status_meaning
    wf_rules_scope = wf_rules_scope.match_value("#{Irm::WfRule.table_name}.name",params[:name])
    wf_rules_scope = wf_rules_scope.match_value("#{Irm::WfRule.table_name}.rule_code",params[:rule_code])
    wf_rules,count = paginate(wf_rules_scope)
    respond_to do |format|
      format.json {render :json=>to_jsonp(wf_rules.to_grid_json([:name,:bo_name,:rule_code,:evaluate_criteria_rule_name],count))}
      format.html {
        @datas = wf_rules
        @count = count
      }
    end
  end

  def add_exists_action

  end

  def save_exists_action
    action_types = [[Irm::WfFieldUpdate,Irm::BusinessObject.class_name_to_code(Irm::WfFieldUpdate.name)],[Irm::WfMailAlert,Irm::BusinessObject.class_name_to_code(Irm::WfMailAlert.name)]]
    selected_actions = params[:selected_actions].split(",")
    exists_actions = Irm::WfRuleAction.where(:rule_id=>params[:id],:time_trigger_id=>params[:trigger_id])
    exists_actions.each do |action|
      action_type = action_types.detect{|i| i[0].name.eql?(action.action_type)}
      if selected_actions.include?("#{action_type[1]}##{action.action_reference_id}")
        selected_actions.delete("#{action_type[1]}##{action.action_reference_id}")
      else
        action.destroy
      end
    end

    selected_actions.each do |action_str|
      next unless action_str.strip.present?
      action = action_str.split("#")
      action_type = action_types.detect{|i| i[1].eql?(action[0])}
      Irm::WfRuleAction.create(:rule_id=>params[:id],
                               :time_trigger_id=>params[:trigger_id],
                               :action_type=>action_type[0].name,
                               :action_reference_id=>action[1])
    end if selected_actions.any?

    respond_to do |format|
      format.html { redirect_back_or_default({:action=>"show",:id=>params[:id]}) }
      format.xml  { head :ok }
    end
  end


  def get_data_by_action
    wf_rules_scope = Irm::WfRule.select_all.with_bo(I18n.locale).query_by_action(params[:action_type],params[:action_id])
    wf_rules_scope = wf_rules_scope.match_value("#{Irm::WfApprovalProcess.table_name}.name",params[:name])
    wf_rules_scope = wf_rules_scope.match_value("#{Irm::WfApprovalProcess.table_name}.description",params[:description])
    wf_rules,count = paginate(wf_rules_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(wf_rules.to_grid_json([:name,:description,:status_code,:bo_name], count)) }
      format.html  {
        @datas = wf_rules
        @count = count
      }
    end
  end
end
