# -*- coding: utf-8 -*-
class AddGroupForDip < ActiveRecord::Migration
  def up
    irm_function_group_dip_management= Irm::LookupValue.new(:lookup_type=>'IRM_FUNCTION_GROUP_ZONE',:lookup_code=>'DIP_MANAGEMENT',:start_date_active=>'2012-09-10',:status_code=>'ENABLED',:not_auto_mult=>true)
    irm_function_group_dip_management.lookup_values_tls.build(:lookup_value_id=>irm_function_group_dip_management.id,:meaning=>'数据采集管理',:description=>'数据采集管理',:language=>'zh',:status_code=>'ENABLED',:source_lang=>'en')
    irm_function_group_dip_management.lookup_values_tls.build(:lookup_value_id=>irm_function_group_dip_management.id,:meaning=>'HDCM Management',:description=>'HDCM Management',:language=>'en',:status_code=>'ENABLED',:source_lang=>'en')
    irm_function_group_dip_management.save
  end

  def down

  end
end
