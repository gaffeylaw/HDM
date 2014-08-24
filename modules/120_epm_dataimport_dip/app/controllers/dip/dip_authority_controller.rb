class Dip::DipAuthorityController < ApplicationController
  layout "bootstrap_application_full"

  def get_tree_data
    tree_nodes = []
    root_organization = Irm::Organization.multilingual.where({:parent_org_id => nil, :status_code => "ENABLED"}).order("name")
    root_organization.each do |org|
      tree_node=get_child_notes(org)
      tree_nodes << tree_node
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
      end
    end
    respond_to do |format|
      format.json {
        render :json => nil
      }
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
    children=[]
    if org.id
      Irm::Organization.multilingual.where({:parent_org_id => org.id, :status_code => "ENABLED"}).each do |c|
        children << get_child_notes(c)
      end
    end
    name=org[:name]
    tree_node={:id => org.id, :name => name, :note_type => Dip::DipConstant::AUTHORITY_GROUP, :text => name, :children => children, :checked => false, :expanded => false}
    tree_node[:children]=tree_node[:children] + get_child_for_org(org)
    tree_node
  end

  def get_child_for_org(org)
    children=[]
    Irm::Person.where({:organization_id => org.id, :status_code => "ENABLED"}).each do |p|
      children << {:id => p.id, :name => p.full_name, :note_type => Dip::DipConstant::AUTHORITY_PERSON, :text => p.full_name, :checked => false, :expanded => false}
    end
    children
  end

end
