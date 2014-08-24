module Irm::ExternalSystemsHelper
  def available_external_systems
     Irm::ExternalSystem.multilingual.enabled
  end

  def available_external_systems_with_person(person_id)
     Irm::ExternalSystem.multilingual.enabled.order_with_name.with_person(person_id)
  end

  def current_person_assessible_external_system_full
    systems = Irm::ExternalSystem.multilingual.order_with_name.with_person(Irm::Person.current.id).enabled#.order("CONVERT( system_name USING gbk ) ")
    systems.collect{|p| [p[:system_name], p.id]}
  end

  def ava_external_systems
    systems = Irm::ExternalSystem.multilingual.enabled
    systems.collect{|p| [p[:system_name], p.id]}
  end

  def ava_external_system_members
    selectable_options = []

    #Person
    targets = current_person_accessible_people_full
    targets.each do |a|
      selectable_options << ["#{t("label_"+Irm::Person.name.underscore.gsub("\/","_"))}:#{a[0]}","P##{a[1]}",{:query=>a[0],:type=>"P"}]
    end

    selectable_options
  end

  def owned_external_system_members
    member_types = [[Irm::Person,"P"]]
    own_members = Irm::ExternalSystemPerson.where(:support_group_id => group_id, :status_code => Irm::Constant::ENABLED)

    members = []
    own_members.each do |member|
      member_type = member_types.detect{|i| i[0].name.eql?(member.source_type)}
      members<<"#{member_type[1]}##{member.source_id}"
    end

    members.join(",")
  end


  def external_system_duel_values
    values = []
    values +=Irm::ExternalSystem.enabled.multilingual.collect.collect{|i| [i[:system_name],i.id,{:type=>"",:query=>i[:system_name]}]}
  end

  def accessable_external_system_duel_values
    values = []
    values +=Irm::ExternalSystem.with_person(Irm::Person.current.id).
        enabled.order_with_name.multilingual.collect.collect{|i| [i[:system_name],i.id,{:type=>"",:query=>i[:system_name]}]}
  end

  def external_system_duel_type
    [Irm::ExternalSystem.name].collect{|i| [Irm::BusinessObject.class_name_to_meaning(i),""]}
  end

end
