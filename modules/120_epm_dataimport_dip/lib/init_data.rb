#-*- coding: utf-8 -*-
require File.expand_path('../init_irm_data.rb', __FILE__)
Fwk::MenuAndFunctionManager.map do |map|
  #===================================================================================================
  map.menu :management_setting, {
      :children => {
          :data_import_management => {
              :type => "menu",
              :entry => {
                  :sequence => 21,
                  :en => {:name => "Data Collection", :description => "Data Collection"},
                  :zh => {:name => "数据采集", :description => "数据采集"},
              }},
      }
  }
#====================================START:data_import_management======================================
  map.menu :data_import_management, {
      :en => {:name => "Data Collection", :description => "Data Collection"},
      :zh => {:name => "数据采集", :description => "数据采集"},
      :children => {
          :category_manage => {
              :type => "function",
              :entry => {
                  :sequence => 5,
                  :en => {:name => "Manage Category", :description => "Manage Category"},
                  :zh => {:name => "分类管理", :description => "分类管理"},
              }},
          :value_set_manage => {
              :type => "function",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "Manage Key Value", :description => "Manage Key Value"},
                  :zh => {:name => "值集管理", :description => "值集管理"},
              }},
          :combination_manage => {
              :type => "function",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Manage Combination", :description => "Manage Combination"},
                  :zh => {:name => "组合管理", :description => "组合管理"},
              }},
          :validation_manage => {
              :type => "function",
              :entry => {
                  :sequence => 30,
                  :en => {:name => "Manage Validation", :description => "Manage Validation"},
                  :zh => {:name => "验证程序", :description => "验证程序"},
              }},
          :template_manage => {
              :type => "function",
              :entry => {
                  :sequence => 40,
                  :en => {:name => "Manage Template", :description => "Manage Template"},
                  :zh => {:name => "模板管理", :description => "模板管理"},
              }},
          :dip_authority_manage => {
              :type => "function",
              :entry => {
                  :sequence => 50,
                  :en => {:name => "Manage Authority", :description => "Manage Authority"},
                  :zh => {:name => "权限管理", :description => "权限管理"},
              }},
          :odi_service_manage => {
              :type => "function",
              :entry => {
                  :sequence => 60,
                  :en => {:name => "Manage ODI Service", :description => "Manage ODI Service"},
                  :zh => {:name => "ODI管理", :description => "ODI管理"},
              }},
          :informatica_service_manage => {
              :type => "function",
              :entry => {
                  :sequence => 70,
                  :en => {:name => "Informatica Manage", :description => "Informatica Manage"},
                  :zh => {:name => "Infa管理", :description => "Infa管理"},
              }},
          :dip_reports_manage => {
              :type => "function",
              :entry => {
                  :sequence => 80,
                  :en => {:name => "Report Management", :description => "Report Management"},
                  :zh => {:name => "报表管理", :description => "报表管理"},
              }}
      }
  }
#====================================END:data_import_management======================================

#=================================START:category_manage=================================
  map.function_group :category_manage, {
      :en => {:name => "Manage Category", :description => "Manage Category"},
      :zh => {:name => "分类管理", :description => "分类管理"}, }
  map.function_group :category_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/dip_category",
      :action => "index"}
  map.function_group :category_manage, {
      :children => {
          :category_manage => {
              :en => {:name => "Manage Category", :description => "Manage Category"},
              :zh => {:name => "分类管理", :description => "分类管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:category_manage=================================

#=================================START:dip_reports_manage=================================
  map.function_group :dip_reports_manage, {
      :en => {:name => "Report Management", :description => "Report Management"},
      :zh => {:name => "报表管理", :description => "报表管理"}, }
  map.function_group :dip_reports_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/dip_report",
      :action => "index"}
  map.function_group :dip_reports_manage, {
      :children => {
          :dip_reports_manage => {
              :en => {:name => "Report Management", :description => "Report Management"},
              :zh => {:name => "报表管理", :description => "报表管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:dip_reports_manage=================================

#=================================START:informatica_service_manage=================================
  map.function_group :informatica_service_manage, {
      :en => {:name => "Informatica", :description => "Informatica"},
      :zh => {:name => "Informatica", :description => "Informatica"}, }
  map.function_group :informatica_service_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/infa_workflow",
      :action => "index"}
  map.function_group :informatica_service_manage, {
      :children => {
          :informatica_service_manage => {
              :en => {:name => "Infa Manage", :description => "Infa Manage"},
              :zh => {:name => "Infa管理", :description => "Infa管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:informatica_service_manage=================================

#=================================START:odi_service_manage=================================
  map.function_group :odi_service_manage, {
      :en => {:name => "Manage ODI Service", :description => "Manage ODI Service"},
      :zh => {:name => "ODI管理", :description => "ODI管理"}, }
  map.function_group :odi_service_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/odi_interface",
      :action => "index"}
  map.function_group :odi_service_manage, {
      :children => {
          :odi_service_manage => {
              :en => {:name => "Manage ODI Service", :description => "Manage ODI Service"},
              :zh => {:name => "ODI管理", :description => "ODI管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:odi_service_manage=================================

#=================================START:value_set_manage=================================
  map.function_group :value_set_manage, {
      :en => {:name => "Value Set Manage", :description => "Value Set Manage"},
      :zh => {:name => "值集管理", :description => "值集管理"}, }
  map.function_group :value_set_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/header_value",
      :action => "index"}
  map.function_group :value_set_manage, {
      :children => {
          :value_set_manage => {
              :en => {:name => "Value Set Manage", :description => "Value Set Manage"},
              :zh => {:name => "值集管理", :description => "值集管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:value_set_manage=================================

#=================================START:combination_manage=================================
  map.function_group :combination_manage, {
      :en => {:name => "Manage Combination", :description => "Manage Combination"},
      :zh => {:name => "组合管理", :description => "组合管理"}, }
  map.function_group :combination_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/combination",
      :action => "index"}
  map.function_group :combination_manage, {
      :children => {
          :combination_manage => {
              :en => {:name => "Manage Combination", :description => "Manage Combination"},
              :zh => {:name => "组合管理", :description => "组合管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:combination_manage=================================

#=================================START:template_manage=================================
  map.function_group :template_manage, {
      :en => {:name => "Manage Template", :description => "Manage Template"},
      :zh => {:name => "模板设置", :description => "模板设置"}, }
  map.function_group :template_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/template",
      :action => "setting"}
  map.function_group :template_manage, {
      :children => {
          :template_manage => {
              :en => {:name => "Manage Template", :description => "Manage Template"},
              :zh => {:name => "模板管理", :description => "模板管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:template_manage=================================
#=================================START:validation_manage=================================
  map.function_group :validation_manage, {
      :en => {:name => "Manage Validation", :description => "Manage Validation"},
      :zh => {:name => "验证程序管理", :description => "验证程序管理"}, }
  map.function_group :validation_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/validation",
      :action => "index"}
  map.function_group :validation_manage, {
      :children => {
          :validation_manage => {
              :en => {:name => "Manage Validation", :description => "Manage Validation"},
              :zh => {:name => "验证程序管理", :description => "验证程序管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:validation_manage=================================
#
#=================================START:Manage Template Group=================================
  map.function_group :dip_authority_manage, {
      :en => {:name => "Manage Authority", :description => "Manage Authority"},
      :zh => {:name => "权限管理", :description => "权限管理"}}
  map.function_group :dip_authority_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/dip_authority",
      :action => "index"}
  map.function_group :dip_authority_manage, {
      :children => {
          :dip_authority_manage => {
              :en => {:name => "Manage Authority", :description => "Manage Authority"},
              :zh => {:name => "权限管理", :description => "权限管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:Manage Template Group=================================

#=================================START:epm_data_import=================================
  map.function_group :epm_data_import, {
      :en => {:name => "Data Import", :description => "Data Import"},
      :zh => {:name => "数据导入", :description => "数据导入"}, }
  map.function_group :epm_data_import, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/template",
      :action => "index"}
  map.function_group :epm_data_import, {
      :children => {
          :epm_data_import => {
              :en => {:name => "Data Import", :description => "Data Import"},
              :zh => {:name => "数据导入", :description => "数据导入"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:epm_data_import=================================

#=================================START:epm_data_import_status=================================
  map.function_group :epm_data_import_status, {
      :en => {:name => "Data Import Status", :description => "Data Import Status"},
      :zh => {:name => "数据导入状态", :description => "数据导入状态"}, }
  map.function_group :epm_data_import_status, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/import_management",
      :action => "index"}
  map.function_group :epm_data_import_status, {
      :children => {
          :epm_data_import_status => {
              :en => {:name => "Data Import Status", :description => "Data Import Status"},
              :zh => {:name => "数据导入状态", :description => "数据导入状态"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:epm_data_import_status=================================
#=================================START:epm_data_import_status=================================
  map.function_group :dip_run_odi_interface, {
      :en => {:name => "Run ODI Interface", :description => "Run ODI Interface"},
      :zh => {:name => "运行ODI接口", :description => "运行ODI接口"}, }
  map.function_group :dip_run_odi_interface, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/odi_interface",
      :action => "run_interface"}
  map.function_group :dip_run_odi_interface, {
      :children => {
          :dip_run_odi_interface => {
              :en => {:name => "Run ODI Interface", :description => "Run ODI Interface"},
              :zh => {:name => "运行ODI接口", :description => "运行ODI接口"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:epm_data_import_status=================================
#=================================START:dip_reports=================================
  map.function_group :dip_reports, {
      :en => {:name => "Reports", :description => "Reports"},
      :zh => {:name => "报表", :description => "报表"}, }
  map.function_group :dip_reports, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/dip_report",
      :action => "query"}
  map.function_group :dip_reports, {
      :children => {
          :dip_reports => {
              :en => {:name => "Reports", :description => "Reports"},
              :zh => {:name => "报表", :description => "报表"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:dip_reports=================================

#=================================START:dip_run_informatica=================================
  map.function_group :dip_run_informatica, {
      :en => {:name => "Informatica Invoke", :description => "Informatica Invoke"},
      :zh => {:name => "Informatica调用", :description => "Informatica调用"}, }
  map.function_group :dip_run_informatica, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/infa_workflow",
      :action => "run"}
  map.function_group :dip_run_informatica, {
      :children => {
          :dip_run_informatica => {
              :en => {:name => "Informatica Invoke", :description => "Informatica Invoke"},
              :zh => {:name => "Informatica调用", :description => "Informatica调用"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:dip_reports=================================

#=================================START:Header Manage=================================
  map.function_group :value_set_category_manage, {
      :en => {:name => "Value Set Category Manage", :description => "Value Set Category Manage"},
      :zh => {:name => "值集分类管理", :description => "值集分类管理"}, }
  map.function_group :value_set_category_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/header",
      :action => "get_data"}
  map.function_group :value_set_category_manage, {
      :children => {
          :value_set_category_manage => {
              :en => {:name => "Value Set Category Manage", :description => "Value Set Category Manage"},
              :zh => {:name => "值集分类管理", :description => "值集分类管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:Header Manage=================================

#=================================START:Approval=================================
  map.function_group :approval_manage, {
      :en => {:name => "Approval Manage", :description => "Approval Manage"},
      :zh => {:name => "审批管理", :description => "审批管理"}, }
  map.function_group :approval_manage, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/approval_status",
      :action => "index"}
  map.function_group :approval_manage, {
      :children => {
          :approval_manage => {
              :en => {:name => "Approval Manage", :description => "Approval Manage"},
              :zh => {:name => "审批管理", :description => "审批管理"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:Approval=================================

#=================================START:Approval_reset=================================
  map.function_group :approval_reset, {
      :en => {:name => "Approval Reset", :description => "Approval Reset"},
      :zh => {:name => "审批控制", :description => "审批控制"}, }
  map.function_group :approval_reset, {
      :zone_code => "DIP_MANAGEMENT",
      :controller => "dip/approval_status",
      :action => "manage"}
  map.function_group :approval_reset, {
      :children => {
          :approval_reset => {
              :en => {:name => "Approval Reset", :description => "Approval Reset"},
              :zh => {:name => "审批控制", :description => "审批控制"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
          },
      }
  }
#=================================END:Approval_reset=================================

  map.function :combination_manage, {"dip/combination" => ["index", "getHeaderList", "rename", "delete", "get_data", "create", "destroy", "enable", "in_process", "close"]}

  map.function :value_set_manage, {"dip/header_value" => ["index","sync_value", "get_data", "create", "destroy", "update", "enable", "disable"]}

  map.function :value_set_category_manage, {"dip/header" => ["get_data", "create", "update", "destroy", "get_header"]}

  map.function :template_manage, {"dip/dip_category" => ["get_tree_data"]}
  map.function :template_manage, {"dip/template" => ["get_category_template", "new", "setting", "create", "edit", "destroy", "update"]}
  map.function :template_manage, {"dip/template_column" => ["get_data", "reorder", "new", "edit", "create", "update", "destroy"]}
  map.function :template_manage, {"dip/template_validation" => ["get_data", "new", "edit", "create", "update", "destroy", "index"]}

  map.function :validation_manage, {"dip/validation" => ["get_data", "new", "edit", "create", "update", "destroy", "index"]}

  map.function :epm_data_import, {"dip/template" => ["can_create_data","get_ahead_data", "save_data", "index", "query", "export_data", "get_query_data", "next_value_list", "show", "import", "export", "get_data", "upload", "get_data_authorized","submit_data"]}
  map.function :epm_data_import_status, {"dip/import_management" => ["index", "get_data", "destroy", "query",  "get_query_data", "export_data"]}
  map.function :epm_data_import_status, {"dip/error" => ["index", "get_data"]}

  map.function :odi_service_manage, {"dip/parameter" => ["create", "update", "destroy","odi_parameter","get_odi_parameter"]}
  map.function :odi_service_manage, {"dip/odi_server" => ["index", "create", "update", "destroy", "get_data", "get_edit_data"]}
  map.function :odi_service_manage, {"dip/odi10_server" => ["index", "create", "update", "destroy", "get_data", "get_edit_data"]}
  map.function :odi_service_manage, {"dip/odi_interface" => ["index","get_parameter_set","bind_parameter_set", "create", "update", "destroy", "get_data", "run"]}
  map.function :odi_service_manage, {"dip/parameter_set" => ["odi_index","add_parameter","get_parameter_data", "get_data", "create", "edit", "destroy"]}

  map.function :dip_run_odi_interface, {"dip/odi_interface" => ["run_interface", "run", "get_run_data", "get_interface", "get_param", "query_status"]}

  map.function :epm_data_import, {"dip/dip_category" => ["get_tree_data"]}

  map.function :dip_reports_manage, {"dip/dip_report" => ["index", "new", "get_data", "edit", "create", "update", "destroy"]}
  map.function :dip_reports_manage, {"dip/dip_category" => ["get_tree_data"]}
  map.function :dip_reports_manage, {"dip/parameter_set" => ["report_index","add_parameter","get_parameter_data", "get_data", "create", "edit", "destroy"]}
  map.function :dip_reports_manage, {"dip/parameter" => ["create", "update", "destroy","report_parameter","get_report_parameter"]}

  map.function :dip_reports, {"dip/dip_report" => ["query", "get_data_authorized", "show", "export", "get_report_data"]}
  map.function :dip_reports, {"dip/dip_category" => ["get_tree_data"]}

  map.function :category_manage, {"dip/dip_category" => ["get_category_list", "get_type_tree_data", "get_data", "index", "create", "update", "destroy"]}

  map.function :dip_authority_manage, {"dip/dip_authority" => ["add_odi_authority", "get_authorized_odi",
                                                               "get_unauthorized_odi",
                                                               "add_report_authority", "get_authorized_report",
                                                               "get_unauthorized_report", "add_template_authority",
                                                               "get_unauthorized_template", "get_authorized_template",
                                                               "destroy_authorized", "get_tree_data", "index",
                                                               "get_authorized_value", "get_unauthorized_value",
                                                               "add_value_authority","add_infa_authority","get_authorized_infa","get_unauthorized_infa"]}

  map.function :informatica_service_manage, {"dip/infa_repository" => ["index", "get_repository_info", "synch", "get_data", "create", "update", "destroy"]}
  map.function :informatica_service_manage, {"dip/infa_workflow" => ["index", "get_parameter_set","bind_parameter_set","get_data", "destroy", "update","create"]}
  map.function :informatica_service_manage, {"dip/parameter_set" => ["infa_index", "add_parameter","get_parameter_data","get_data", "create", "edit", "destroy"]}
  map.function :informatica_service_manage, {"dip/parameter" => ["create", "update", "destroy","infa_parameter","get_infa_parameter"]}

  map.function :dip_run_informatica, {"dip/infa_workflow" => ["run", "get_run_data", "get_run_status", "get_authorized_workflow", "get_param","run_workflow"]}

  map.function :approval_manage, {"dip/approval_status" => ["index","get_data"]}
  map.function :approval_manage, {"dip/approval_node" => ["get_data","approval_agree","approval_reject"]}
  map.function :approval_reset,{"dip/approval_status"=>["get_manage_data","manage"]}
  map.function :approval_reset,{"dip/approval_node" => ["approval_reset"]}
end
