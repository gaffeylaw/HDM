class Irm::LdapSourcesController < ApplicationController

  def index
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @ldap_source = Irm::LdapSource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ldap_source }
    end
  end

  def new
    @ldap_source = Irm::LdapSource.new(:status_code=>"OFFLINE")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ldap_source }
    end
  end

  def execute_test
    @ldap_source = Irm::LdapSource.find(params[:id])
    @result_message =@ldap_source.test_connection
  end

  def edit
    @ldap_source = Irm::LdapSource.find(params[:id])
  end


  def create
    @ldap_source = Irm::LdapSource.new(params[:irm_ldap_source])
    @ldap_source.opu_id = Irm::OperationUnit.current.id
    respond_to do |format|
      if @ldap_source.save
        format.html { redirect_to({:action=>"index"}, :notice =>t(:successfully_created)) }
        format.xml  { render :xml => @ldap_source, :status => :created, :location => @ldap_source }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ldap_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ldap_source = Irm::LdapSource.find(params[:id])

    respond_to do |format|
      if @ldap_source.update_attributes(params[:irm_ldap_source])
        format.html { redirect_to({:action=>"index"}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ldap_source.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ldap_source = Irm::LdapSource.find(params[:id])
    @ldap_source.destroy

    respond_to do |format|
      format.html { redirect_to(ldap_source_url) }
      format.xml  { head :ok }
    end
  end


  def active
    @ldap_source = Irm::LdapSource.find(params[:id])
    attrs = {}
    if(Irm::Constant::SYS_YES.eql?(params[:active]))
      attrs =  {:status_code=>"ENABLED"}
    else
      attrs =  {:status_code=>"OFFLINE"}
    end

    respond_to do |format|
      if @ldap_source.update_attributes(attrs)
        format.html { redirect_to({:action=>"show",:id=>@ldap_source.id}, :notice => t(:successfully_updated)) }
        format.xml  { head :ok }
      else
        format.html { redirect_to({:action=>"show",:id=>@ldap_source.id}) }
        format.xml  { render :xml => @ldap_source.errors, :status => :unprocessable_entity }
      end
    end
  end



  def get_data
    ldap_sources_scope = Irm::LdapSource
    ldap_sources_scope = ldap_sources_scope.match_value("#{Irm::LdapSource.table_name}.name",params[:name])
    ldap_sources_scope = ldap_sources_scope.match_value("#{Irm::LdapSource.table_name}.host",params[:host])
    ldap_sources_scope = ldap_sources_scope.match_value("#{Irm::LdapSource.table_name}.account",params[:account])
    ldap_sources,count = paginate(ldap_sources_scope)
    respond_to do |format|
      format.json  {render :json => to_jsonp(ldap_sources.to_grid_json([:name, :host, :port, :account, :base_dn, :status_meaning, :status_code], count)) }
      format.html  {
        @count = count
        @datas = ldap_sources
      }
    end
  end
end
