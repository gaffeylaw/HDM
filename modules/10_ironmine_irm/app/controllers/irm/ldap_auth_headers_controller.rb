class Irm::LdapAuthHeadersController < ApplicationController
  # GET /ldap_auth_headers
  # GET /ldap_auth_headers.xml
  def index
    @ldap_auth_headers = Irm::LdapAuthHeader.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @ldap_auth_headers }
    end
  end

  # GET /ldap_auth_headers/1
  # GET /ldap_auth_headers/1.xml
  def show
    @ldap_auth_header = Irm::LdapAuthHeader.list_all.find(params[:id])
    puts @ldap_auth_header.ldap_source.name
    respond_to do |format|
      format.html # show.html.erb
      format.xml { render :xml => @ldap_auth_header }
    end
  end

  # GET /ldap_auth_headers/new
  # GET /ldap_auth_headers/new.xml
  def new
    @ldap_auth_header = Irm::LdapAuthHeader.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml { render :xml => @ldap_auth_header }
    end
  end

  # GET /ldap_auth_headers/1/edit
  def edit
    @ldap_auth_header = Irm::LdapAuthHeader.find(params[:id])
  end

  # POST /ldap_auth_headers
  # POST /ldap_auth_headers.xml
  def create
    @ldap_auth_header = Irm::LdapAuthHeader.new(params[:irm_ldap_auth_header])
    respond_to do |format|
      if @ldap_auth_header.save
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_created)) }
        format.xml { render :xml => @ldap_auth_header, :status => :created, :location => @ldap_auth_header }
      else
        format.html { render :action => "new" }
        format.xml { render :xml => @ldap_auth_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ldap_auth_headers/1
  # PUT /ldap_auth_headers/1.xml
  def update
    @ldap_auth_header = Irm::LdapAuthHeader.find(params[:id])

    respond_to do |format|
      if @ldap_auth_header.update_attributes(params[:irm_ldap_auth_header])
        format.html { redirect_to({:action => "index"}, :notice => t(:successfully_updated)) }
        format.xml { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml { render :xml => @ldap_auth_header.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ldap_auth_headers/1
  # DELETE /ldap_auth_headers/1.xml
  def destroy
    @ldap_auth_header = Irm::LdapAuthHeader.find(params[:id])
    @ldap_auth_header.destroy

    respond_to do |format|
      format.html { redirect_to(ldap_auth_headers_url) }
      format.xml { head :ok }
    end
  end


  def get_data
    ldap_auth_headers_scope = Irm::LdapAuthHeader.list_all
    ldap_auth_headers_scope = ldap_auth_headers_scope.match_value("#{Irm::LdapAuthHeader.table_name}.name", params[:ldap_source_name])
    ldap_auth_headers, count = paginate(ldap_auth_headers_scope)
    respond_to do |format|
      format.json { render :json => to_jsonp(ldap_auth_headers.to_grid_json([:ldap_source_name, :name, :auth_cn, :description, :status_code], count)) }
      format.html {
        @count = count
        @datas = ldap_auth_headers
      }
    end
  end

  def get_by_ldap_source
    ldap_auth_headers_scope = Irm::LdapAuthHeader.enabled.query_by_ldap_source(params[:belonged_ldap_source_id])
    ldap_auth_headers = ldap_auth_headers_scope.collect { |i| {:label => i[:name], :value => i.id, :id => i.id} }
    respond_to do |format|
      format.json { render :json => ldap_auth_headers.to_grid_json([:label, :value], ldap_auth_headers.count) }
    end
  end

  def sync
    result={:success => true}
    begin
      users=params[:user_ids]
      ldap_header_id=params[:id]
      ldap_header= Irm::LdapAuthHeader.find(ldap_header_id)
      ldap_src= Irm::LdapSource.find(ldap_header[:ldap_source_id])
      encoding= ldap_src[:encoding]
      ldap = Net::LDAP.new
      ldap.base= ldap_src[:base_dn].force_encoding(encoding)
      ldap.host = ldap_src[:host]
      ldap.port = ldap_src[:port]
      ldap.auth ldap_src[:account], ldap_src[:account_password]

      person_attr = {}
      return_attrs = {:login_name => ldap_header.ldap_login_name_attr, :email_address => ldap_header.ldap_email_address_attr}
      ldap_header.ldap_auth_attributes.each do |attr|
        return_attrs[attr.local_attr.to_sym] = attr.ldap_attr
      end

      if ldap.bind
        users.each do |user|
          filter = Net::LDAP::Filter.eq(ldap_header[:ldap_login_name_attr], user)
          treebase = ldap_header[:auth_cn].force_encoding(encoding)
          ldap.search(:base => treebase, :filter => filter, :attributes => return_attrs.values) do |entry|
            filed_to_value = {}
            return_attrs.each do |key, value|
              return_value = ldap_header.class.get_attr(entry, value)
              if return_value.present?
                return_value = return_value.force_encoding("utf-8")
                filed_to_value[value.to_sym] = return_value
                person_attr[key]= return_value
              end
            end
            person_attr[:auth_source_id] = ldap_header.id
            person_attr[:email_address] = "#{person_attr[:login_name]}@hand-china.com" unless person_attr[:email_address].present?
            person_attr[:first_name] = person_attr[:login_name] unless person_attr[:first_name].present?
            ldap_header.create_ldap_person(person_attr, filed_to_value)
          end
        end
        result[:msg]=[t(:label_operation_success)]
      else
        result[:success]=false
        result[:msg]=["Can't connect to LDAP"]
        logger.error "Can't connect to LDAP"
      end
    rescue => ex
      result[:success]=false
      result[:msg]=[ex.message]
      logger.error ex
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_ldap_data
    datas=[]
    begin
      ldap_user_id=params[:id]
      ldap_header= Irm::LdapAuthHeader.find(ldap_user_id)
      ldap_src= Irm::LdapSource.find(ldap_header[:ldap_source_id])
      encoding=ldap_src[:encoding]

      ldap = Net::LDAP.new
      ldap.base= ldap_src[:base_dn].force_encoding(encoding)
      ldap.host = ldap_src[:host]
      ldap.port = ldap_src[:port]
      ldap.auth ldap_src[:account], ldap_src[:account_password]
      filter = nil
      ldap_header.ldap_auth_rules.each do |rule|
        filter_new=nil
        case rule[:operator_code]
          when 'E'
            filter_new= Net::LDAP::Filter.eq(rule[:attr_field], rule[:attr_value].to_s.force_encoding(encoding))
          when 'N'
            filter_new= Net::LDAP::Filter.ne(rule[:attr_field], rule[:attr_value].to_s.force_encoding(encoding))
        end
        if filter.nil?
          filter=filter_new
        else
          filter= Net::LDAP::Filter.join(filter, filter_new)
        end
      end

      if ldap.bind
        treebase = ldap_header[:auth_cn].force_encoding(encoding)
        attributes=[]
        attributes << ldap_header[:ldap_login_name_attr]
        attributes << ldap_header[:ldap_email_address_attr]
        attrs={}
        ldap_header.ldap_auth_attributes.each do |attr|
          attrs[attr.local_attr.to_sym] = attr.ldap_attr
        end
        attributes << attrs[:first_name] if attrs[:first_name]
        ldap.search(:base => treebase, :filter => filter, :attributes => attributes) do |entry|
          datas << {:login_name => entry[ldap_header[:ldap_login_name_attr].to_s.downcase].first.to_s.force_encoding("UTF-8"),
                    :mail => entry[ldap_header[:ldap_email_address_attr].to_s.downcase].first.to_s.force_encoding("UTF-8"),
                    :user_name => attrs[:first_name].nil? ? "" : entry[attrs[:first_name]].first.to_s.force_encoding("UTF-8")}
        end
      else
        logger.error "Can't connect to LDAP"
      end
    rescue => ex
      logger.error(ex)
    end
    datas.sort! { |x, y| x[:login_name].to_s.downcase<=>y[:login_name].to_s.downcase }
    respond_to do |format|
      format.html {
        @datas1=datas[params[:start].to_i, params[:limit].to_i]
        @count1=datas.size
      }
    end
  end

end
