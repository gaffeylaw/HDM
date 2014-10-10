class Dip::DipAuthorityController < ApplicationController
  layout "bootstrap_application_full"

  def get_tree_data
    tree_nodes = []
    root=params[:root]
    if root=='source'
      tree_nodes=get_child_notes(nil)
    else
      tree_nodes=get_child_notes(root)
    end
    respond_to do |format|
      format.json { render :json => tree_nodes.to_json }
    end
  end

  def index
    respond_to do |format|
      format.html
    end
  end

  def get_authorized_value
    dip_value_authorities=[]
    count=0
    headerId=params[:headerId].to_s
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if headerId.size>0 && targetId.size>0 && targetType.size>0
      dip_value_authorities, count=Dip::DipAuthority.get_all_authorized_value_data_paged(targetId, targetType, Dip::DipConstant::AUTHORITY_VALUE,
                                                                                         headerId, params[:start].to_i, params[:limit].to_i)
    end
    respond_to do |format|
      format.html {
        @datas = dip_value_authorities
        @count = count
        @targetId=targetId
      }
    end
  end

  def get_unauthorized_value
    datas=[]
    count=0
    headerId=params[:headerId].to_s
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if headerId.size>0 && targetId.size>0 && targetType.size>0
      valueIds=Dip::DipAuthority.get_all_authorized_value_data(targetId, targetType, Dip::DipConstant::AUTHORITY_VALUE, headerId)
      if valueIds.any?
        value_str=valueIds.collect { |v| "'"+v.function+"'" }.join(",")
        values=Dip::HeaderValue.where(:header_id => headerId)
        values=values.where("enabled=1 and id not in (#{value_str})").order("value")
      else
        values=Dip::HeaderValue.where({:enabled=>1,:header_id => headerId}).order("value")
      end
      values= values.match_value("value", params[:value])
      datas, count=paginate(values)
    end
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def add_value_authority
    valueIds= params[:valueIds]
    targetId= params[:targetId]
    targetType= params[:targetType]
    result={:success => true}
    if valueIds
      valueIds.each do |v|
        authority=Dip::DipAuthority.new({:target => targetId,
                                         :target_type => targetType,
                                         :function => v,
                                         :function_type => Dip::DipConstant::AUTHORITY_VALUE})
        authority.save
      end
      syncAuthority()
    end
    respond_to do |format|
      format.json {
        render :json => nil
      }
    end
  end

  def destroy_authorized
    valueIds=params[:valueIds]
    targetId=params[:targetId]
    if valueIds
      valueIds.each do |v|
        Dip::DipAuthority.where({:id => v, :target => targetId}).first.destroy
      end
      syncAuthority()
    end
    respond_to do |format|
      format.json {
        render :json => nil
      }
    end
  end

  def get_authorized_template
    dip_value_authorities=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      dip_value_authorities, count=Dip::DipAuthority.get_all_authorized_data_paged(targetId, targetType, Dip::DipConstant::AUTHORITY_TEMPLATE,
                                                                                   params[:start].to_i, params[:limit].to_i)
    end
    respond_to do |format|
      format.html {
        @datas = dip_value_authorities
        @count = count
        @targetId=targetId
      }
    end
  end

  def get_unauthorized_template
    datas=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      valueIds=Dip::DipAuthority.get_all_authorized_data(targetId, targetType, Dip::DipConstant::AUTHORITY_TEMPLATE)
      if valueIds.any?
        value_str=valueIds.collect { |v| "'"+v.function+"'" }.join(",")
        values=Dip::Template.where(" id not in (#{value_str})").order("name")
      else
        values=Dip::Template.order("name")
      end
      values= values.match_value("name", params[:name])
      datas, count=paginate(values)
    end
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def add_template_authority
    valueIds= params[:valueIds]
    targetId= params[:targetId]
    targetType= params[:targetType]
    result={:success => true}
    if valueIds
      valueIds.each do |v|
        authority=Dip::DipAuthority.new({:target => targetId,
                                         :target_type => targetType,
                                         :function => v,
                                         :function_type => Dip::DipConstant::AUTHORITY_TEMPLATE})
        authority.save
        syncAuthority()
      end
    end
    respond_to do |format|
      format.json {
        render :json => nil
      }
    end
  end
  def syncAuthority
    Dip::DipAuthority.mutex().lock
    version=UUID.new.generate(:compact)
    Irm::Person.select("ID,ORGANIZATION_ID").all.each do|p|
      Dip::CommonModel.find_by_sql(%{select t1.FUNCTION,t1.FUNCTION_TYPE from DIP_DIP_AUTHORITIES t1,
          (select t.id from IRM_ORGANIZATIONS t start with t.id='#{p[:organization_id]}'
          connect by t.id= prior t.PARENT_ORG_ID)t2
          where t1.TARGET_TYPE='GROUP' and
          t1.target=t2.id
          union
          select t3.FUNCTION,t3.FUNCTION_TYPE from DIP_DIP_AUTHORITIES t3 where t3.target='#{p[:id]}'
          and t3.target_type='PERSON'}).each do|auth|
        Dip::Authorityx.new({:person_id=>p[:id],
                             :function_type=>auth[:function_type],
                             :function=>auth[:function],
                             :version=>version}).save
      end
    end
    ActiveRecord::Base.connection().execute("delete from dip_authorityxes t where t.version <>'#{version}'")
    Dip::DipAuthority.mutex().unlock
  end

  def syncAuthority1
    Dip::DipAuthority.mutex().lock
    version=UUID.new.generate(:compact)
    ActiveRecord::Base.connection().execute("update dip_authorityxes t set t.version=null")
    Dip::DipAuthority.all.each do |data|
      if data[:target_type]=="GROUP"
        syncGroup(data[:target],data,version)
      else
        old_record=Dip::Authorityx.where({:person_id=>data[:target],
                               :function=>data[:function],
                               :function_type=>data[:function_type]}).first
        if old_record
          old_record.update_attributes({:version=>version})
        else
          Dip::Authorityx.new({:person_id=>data[:target],
                               :function_type=>data[:function_type],
                               :function=>data[:function],
                               :version=>version}).save
        end
      end

    end
    ActiveRecord::Base.connection().execute("delete from dip_authorityxes t where t.version is null")
    Dip::DipAuthority.mutex().unlock
  end
  def syncGroup(groupId,data,version)
    Irm::Person.where({:organization_id => groupId, :status_code => "ENABLED"}).each do |p|
      old_record=Dip::Authorityx.where({:person_id=>p[:id],
                                        :function=>data[:function],
                                        :function_type=>data[:function_type]}).first
      if old_record
        old_record.update_attributes({:version=>version})
      else
        Dip::Authorityx.new({:person_id=>p[:id],
                             :function_type=>data[:function_type],
                             :function=>data[:function],
                             :version=>version}).save
      end
    end
    Irm::Organization.where(:parent_org_id=>groupId).each do |org|
      syncGroup(org[:id],data,version)
    end

  end

  # Report
  def get_authorized_report
    dip_value_authorities=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      dip_value_authorities, count=Dip::DipAuthority.get_all_authorized_data_paged(targetId, targetType, Dip::DipConstant::AUTHORITY_REPORT,
                                                                                   params[:start].to_i, params[:limit].to_i)
    end
    respond_to do |format|
      format.html {
        @datas = dip_value_authorities
        @count = count
        @targetId=targetId
      }
    end
  end

  def get_unauthorized_report
    datas=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      valueIds=Dip::DipAuthority.get_all_authorized_data(targetId, targetType, Dip::DipConstant::AUTHORITY_REPORT)
      if valueIds.any?
        value_str=valueIds.collect { |v| "'"+v.function+"'" }.join(",")
        values=Dip::DipReport.where(" id not in (#{value_str})").order("name")
      else
        values=Dip::DipReport.order("name")
      end
      values= values.match_value("name", params[:name])
      datas, count=paginate(values)
    end
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def add_report_authority
    valueIds= params[:valueIds]
    targetId= params[:targetId]
    targetType= params[:targetType]
    result={:success => true}
    if valueIds
      valueIds.each do |v|
        authority=Dip::DipAuthority.new({:target => targetId,
                                         :target_type => targetType,
                                         :function => v,
                                         :function_type => Dip::DipConstant::AUTHORITY_REPORT})
        authority.save
      end
      syncAuthority()
    end
    respond_to do |format|
      format.json {
        render :json => nil
      }
    end
  end

  # ODI
  def get_authorized_odi
    dip_value_authorities=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      dip_value_authorities, count=Dip::DipAuthority.get_all_authorized_data_paged(targetId, targetType, Dip::DipConstant::AUTHORITY_ODI,
                                                                                   params[:start].to_i, params[:limit].to_i)
    end
    respond_to do |format|
      format.html {
        @datas = dip_value_authorities
        @count = count
        @targetId=targetId
      }
    end
  end

  def get_unauthorized_odi
    datas=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      valueIds=Dip::DipAuthority.get_all_authorized_data(targetId, targetType, Dip::DipConstant::AUTHORITY_ODI)
      if valueIds.any?
        value_str=valueIds.collect { |v| "'"+v.function+"'" }.join(",")
        values=Dip::OdiInterface.where(" id not in (#{value_str})").order("interface_name")
      else
        values=Dip::OdiInterface.order("interface_name")
      end
      values= values.match_value("interface_name", params[:interface_name])
      datas, count=paginate(values)
    end
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def add_odi_authority
    valueIds= params[:valueIds]
    targetId= params[:targetId]
    targetType= params[:targetType]
    result={:success => true}
    if valueIds
      valueIds.each do |v|
        authority=Dip::DipAuthority.new({:target => targetId,
                                         :target_type => targetType,
                                         :function => v,
                                         :function_type => Dip::DipConstant::AUTHORITY_ODI})
        authority.save
      end
      syncAuthority()
    end
    respond_to do |format|
      format.json {
        render :json => nil
      }
    end
  end

  #infa
  def get_authorized_infa
    dip_value_authorities=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      dip_value_authorities, count=Dip::DipAuthority.get_all_authorized_data_paged(targetId, targetType, Dip::DipConstant::AUTHORITY_INFORMATICA,
                                                                                   params[:start].to_i, params[:limit].to_i)
    end
    respond_to do |format|
      format.html {
        @datas = dip_value_authorities
        @count = count
        @targetId=targetId
      }
    end
  end

  def get_unauthorized_infa
    datas=[]
    count=0
    targetId=params[:targetId].to_s
    targetType=params[:targetType].to_s
    if targetId.size>0 && targetType.size>0
      valueIds=Dip::DipAuthority.get_all_authorized_data(targetId, targetType, Dip::DipConstant::AUTHORITY_INFORMATICA)
      if valueIds.any?
        value_str=valueIds.collect { |v| "'"+v.function+"'" }.join(",")
        values=Dip::InfaWorkflow.where(" id not in (#{value_str})").order("name_alias")
      else
        values=Dip::InfaWorkflow.order("name_alias")
      end
      values= values.match_value("name_alias", params[:name_alias])
      datas, count=paginate(values)
    end
    respond_to do |format|
      format.html {
        @datas = datas
        @count = count
      }
    end
  end

  def add_infa_authority
    valueIds= params[:valueIds]
    targetId= params[:targetId]
    targetType= params[:targetType]
    result={:success => true}
    if valueIds
      valueIds.each do |v|
        authority=Dip::DipAuthority.new({:target => targetId,
                                         :target_type => targetType,
                                         :function => v,
                                         :function_type => Dip::DipConstant::AUTHORITY_INFORMATICA})
        authority.save
      end
      syncAuthority()
    end
    respond_to do |format|
      format.json {
        render :json => nil
      }
    end
  end

  #####
  private
  def get_child_notes(org)
    tree_nodes=[]
    Irm::Organization.multilingual.where({:parent_org_id => org, :status_code => "ENABLED"}).order("name").each do|g|
      child_org_count=Irm::Organization.multilingual.where({:parent_org_id => g[:id], :status_code => "ENABLED"}).count
      child_person_count=Irm::Person.where({:organization_id =>g[:id], :status_code => "ENABLED"}).count

      tree_node={:id => g[:id], :name => g[:name], :note_type => Dip::DipConstant::AUTHORITY_GROUP, :text => g[:name],
                 #:children => children,
                 :leaf=>false,
                 :hasChildren=>child_org_count+child_person_count>0 ? true:false,
                 :children=>[],
                 :checked => false, :expanded => false}
      tree_nodes << tree_node
    end
    Irm::Person.where({:organization_id => org, :status_code => "ENABLED"}).each do |p|
      tree_nodes << {:id => p.id, :name => p.full_name,:hasChildren=>false,:note_type => Dip::DipConstant::AUTHORITY_PERSON, :text => p.full_name, :checked => false, :expanded => false}
    end
    tree_nodes
  end
end
