#-*- coding: utf-8 -*-
Fwk::MenuAndFunctionManager.map do |map|
  #====================================START:TOP_MENU======================================
  map.menu :top_menu, {
      :en => {:name => "Top Menu", :description => "Top Menu"},
      :zh => {:name => "顶级菜单 ", :description => "顶级菜单"},
      :children => {
          :personal_profile => {
              :type => "menu",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "Personal Information", :description => "Personal Information"},
                  :zh => {:name => "个人信息", :description => "个人信息"},
              }},
          :global_system_setting => {
              :type => "menu",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Setting", :description => "Setting"},
                  :zh => {:name => "设置", :description => "设置"},
              }},
      }
  }
  #====================================END:TOP_MENU======================================


  #====================================START:PERSONAL_PROFILE======================================
  map.menu :personal_profile, {
      :en => {:name => "Personal Information", :description => "Personal Information"},
      :zh => {:name => "个人信息", :description => "个人信息"},
      :children => {
          :personal_setting => {
              :type => "menu",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "Personal Information", :description => "Personal Information"},
                  :zh => {:name => "个人信息", :description => "个人信息"},
              }},
      }
  }
  #====================================END:PERSONAL_PROFILE======================================

  #====================================START:PERSONAL_SETTING======================================
  map.menu :personal_setting, {
      :en => {:name => "Personal Information", :description => "Personal Information"},
      :zh => {:name => "个人信息", :description => "个人信息"},
      :children => {
          :person_info => {
              :type => "menu",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "My Personal Information", :description => "My Personal Information"},
                  :zh => {:name => "我的个人信息", :description => "我的个人信息"},
              }},
      }
  }
  #====================================END:PERSONAL_SETTING======================================

  #====================================START:PERSON_INFO======================================
  map.menu :person_info, {
      :en => {:name => "My Personal Information", :description => "My Personal Information"},
      :zh => {:name => "我的个人信息", :description => "我的个人信息"},
      :children => {
          :my_info => {
              :type => "function",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "Personal Info", :description => "Personal Info"},
                  :zh => {:name => "个人信息", :description => "查看我的个人信息"},
              }},
          :my_password => {
              :type => "function",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Change Password", :description => "Change Password"},
                  :zh => {:name => "修改我的密码", :description => "修改我的密码"},
              }},
          #:my_avatar => {
          #    :type => "function",
          #    :entry => {
          #        :sequence => 30,
          #        :en => {:name => "Change Avatar", :description => "Change Avatar"},
          #        :zh => {:name => "修改我的头像", :description => "修改我的头像"},
          #    }},
          :my_login_history => {
              :type => "function",
              :entry => {
                  :sequence => 40,
                  :en => {:name => "Login Records", :description => "Login Records"},
                  :zh => {:name => "我的登录历史", :description => "查看我的登录历史"},
              }},
          :my_profile => {
              :type => "function",
              :entry => {
                  :sequence => 15,
                  :en => {:name => "My Profile", :description => "My Profile"},
                  :zh => {:name => "我的简档", :description => "我的简档"},
              }},
      }
  }
  #====================================END:PERSON_INFO======================================

  #====================================START:GLOBAL_SYSTEM_SETTING======================================
  map.menu :global_system_setting, {
      :en => {:name => "Setting", :description => "Setting"},
      :zh => {:name => "设置", :description => "设置"},
      :children => {
          :application_setting => {
              :type => "menu",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "Application Setting", :description => "Application Setting"},
                  :zh => {:name => "应用设置", :description => "应用设置"},
              }},
          :management_setting => {
              :type => "menu",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Setting Management ", :description => "Setting Management "},
                  :zh => {:name => "管理设置", :description => "管理设置"},
              }},
          #:cloud_manage => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 30,
          #        :en => {:name => "Cloud Management", :description => "Cloud Management"},
          #        :zh => {:name => "Cloud管理", :description => "Cloud管理"},
          #    }},
      }
  }
  #====================================END:GLOBAL_SYSTEM_SETTING======================================

  #====================================START:APPLICATION_SETTING======================================
  map.menu :application_setting, {
      :en => {:name => "Application Setting", :description => "Application Setting"},
      :zh => {:name => "应用设置", :description => "应用设置"},
      :children => {
          #:global_custom => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 10,
          #        :en => {:name => "Custom", :description => "Custom"},
          #        :zh => {:name => "自定义", :description => "自定义"},
          #    }},
          :global_create => {
              :type => "menu",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Create", :description => "Create"},
                  :zh => {:name => "创建", :description => "创建"},
              }}
      }
  }
  #====================================END:APPLICATION_SETTING======================================

  #====================================START:GLOBAL_CUSTOM======================================
  #map.menu :global_custom, {
  #    :en => {:name => "Custom", :description => "Custom"},
  #    :zh => {:name => "自定义", :description => "自定义"},
  #    :children => {
  #        :global_setting => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "Global Setting", :description => "Global Setting"},
  #                :zh => {:name => "全局设置", :description => "更改平台标题、图标、附件上限等全局设置"},
  #            }},
  #        :lookup_code => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 30,
  #                :en => {:name => "Lookup Code", :description => "Lookup Code"},
  #                :zh => {:name => "快速编码", :description => "快速编码"},
  #            }}
  #    }
  #}
  #====================================END:GLOBAL_CUSTOM======================================

  #====================================START:GLOBAL_CREATE======================================
  map.menu :global_create, {
      :en => {:name => "Create", :description => "Create"},
      :zh => {:name => "创建", :description => "创建"},
      :children => {
          :application => {
              :type => "function",
              :entry => {
                  :sequence => 15,
                  :en => {:name => "Applications", :description => "Applications"},
                  :zh => {:name => "应用", :description => "应用"},
              }},
          :tab => {
              :type => "function",
              :entry => {
                  :sequence => 35,
                  :en => {:name => "Tabs", :description => "Tabs"},
                  :zh => {:name => "标签页", :description => "定义或修改标签页"},
              }},
          #:report => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 40,
          #        :en => {:name => "Report", :description => "Report"},
          #        :zh => {:name => "报表", :description => "报表"},
          #    }},
          #:security_component => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 50,
          #        :en => {:name => "Security Component", :description => "Security Component"},
          #        :zh => {:name => "安全控件", :description => "安全控件"},
          #    }}
      }
  }
  #====================================END:GLOBAL_CREATE======================================

  #====================================START:SECURITY_COMPONENT======================================
  #map.menu :security_component, {
  #    :en => {:name => "Security Component", :description => "Security Component"},
  #    :zh => {:name => "安全控件", :description => "安全控件"},
  #    :children => {
  #        :menu => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "Menu", :description => "Menu"},
  #                :zh => {:name => "菜单", :description => "定义或修改一个菜单"},
  #            }},
  #        :function_group => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 20,
  #                :en => {:name => "Function Group", :description => "Function Group"},
  #                :zh => {:name => "功能组", :description => "定义或修改一个功能组信息"},
  #            }},
  #        :function => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 30,
  #                :en => {:name => "Function", :description => "Function"},
  #                :zh => {:name => "功能", :description => "定义或修改一个功能"},
  #            }},
  #        :permission => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 40,
  #                :en => {:name => "Permission", :description => "Permission"},
  #                :zh => {:name => "权限", :description => "创建、修改权限定义"},
  #            }},
  #    }
  #}
  #====================================END:SECURITY_COMPONENT======================================

  #====================================START:MANAGEMENT_SETTING======================================
  map.menu :management_setting, {
      :en => {:name => "Setting Management ", :description => "Setting Management "},
      :zh => {:name => "管理设置", :description => "管理设置"},
      :children => {
          :user_management => {
              :type => "menu",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "User Management", :description => "User Management"},
                  :zh => {:name => "管理用户", :description => "管理用户"},
              }},
          :organization_management => {
              :type => "menu",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Organization Information", :description => "Organization Information"},
                  :zh => {:name => "组织信息", :description => "组织信息"},
              }},
          #:site_management => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 30,
          #        :en => {:name => "Site Information", :description => "Site Information"},
          #        :zh => {:name => "地点信息", :description => "地点信息"},
          #    }},
          #:external_system_management => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 40,
          #        :en => {:name => "External System", :description => "External System"},
          #        :zh => {:name => "应用系统", :description => "应用系统"},
          #    }},
          :ldap_management => {
              :type => "menu",
              :entry => {
                  :sequence => 80,
                  :en => {:name => "Ldap Setting", :description => "Ldap Setting"},
                  :zh => {:name => "LDAP集成", :description => "LDAP集成"},
              }},
          #:mail_management => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 90,
          #        :en => {:name => "Mail&Communicate", :description => "Mail&Communicate"},
          #        :zh => {:name => "邮件通信", :description => "邮件通信"},
          #    }},
          #:bulletin_management => {
          #    :type => "menu",
          #    :entry => {
          #        :sequence => 120,
          #        :en => {:name => "Bulletn", :description => "Bulletin"},
          #        :zh => {:name => "公告管理", :description => "公告管理"},
          #    }},
          :security_control => {
              :type => "menu",
              :entry => {
                  :sequence => 130,
                  :en => {:name => "Security Control", :description => "Security Control"},
                  :zh => {:name => "安全控制", :description => "安全控制"},
              }}
      }
  }
  #====================================END:MANAGEMENT_SETTING======================================

  #====================================START:USER_MANAGEMENT======================================
  map.menu :user_management, {
      :en => {:name => "User Management", :description => "User Management"},
      :zh => {:name => "管理用户", :description => "管理用户"},
      :children => {
          :person => {
              :type => "function",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "User", :description => "User"},
                  :zh => {:name => "用户", :description => "添加或编辑用户，更改用户简档、组织、密码等信息"},
              }},
          :profile => {
              :type => "function",
              :entry => {
                  :sequence => 15,
                  :en => {:name => "Profile", :description => "Profile"},
                  :zh => {:name => "简档", :description => "创建一个简档，或启用/禁用简档中的功能"},
              }},
          :role => {
              :type => "function",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Role", :description => "Role"},
                  :zh => {:name => "角色", :description => "创建一个新角色，或定义您的角色层次结构"},
              }},
          #:group => {
          #    :type => "function",
          #    :entry => {
          #        :sequence => 30,
          #        :en => {:name => "Group", :description => "Group"},
          #        :zh => {:name => "组", :description => "创建或编辑个人用户组"},
          #    }},
      }
  }
  #====================================END:USER_MANAGEMENT======================================

  #====================================START:ORGANIZATION_MANAGEMENT======================================
  map.menu :organization_management, {
      :en => {:name => "Organization Information", :description => "Organization Information"},
      :zh => {:name => "组织信息", :description => "组织信息"},
      :children => {
          #:operation_unit => {
          #    :type => "function",
          #    :entry => {
          #        :sequence => 10,
          #        :en => {:name => "Operation Unit", :description => "Operation Unit"},
          #        :zh => {:name => "运维中心", :description => "查看现有的运维中心"},
          #    }},
          :organization => {
              :type => "function",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Organization", :description => "Organization"},
                  :zh => {:name => "组织", :description => "新建一个组织，或定义组织层次结构"},
              }},
          #:organization_info => {
          #    :type => "function",
          #    :entry => {
          #        :sequence => 30,
          #        :en => {:name => "Organization Info", :description => "Organization Info"},
          #        :zh => {:name => "组织信息", :description => "新建、查看、编辑一组织信息"},
          #    }},
      }
  }
  #====================================END:ORGANIZATION_MANAGEMENT======================================

  #====================================START:EXTERNAL_SYSTEM_MANAGEMENT======================================
  #map.menu :external_system_management, {
  #    :en => {:name => "External System", :description => "External System"},
  #    :zh => {:name => "应用系统", :description => "应用系统"},
  #    :children => {
  #        :system => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "External System", :description => "External System"},
  #                :zh => {:name => "应用系统", :description => "新注册一个应用系统，或往系统中添加/移除成员"},
  #            }},
  #        :external_loingid => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 20,
  #                :en => {:name => "External LoginID", :description => "External LoginID"},
  #                :zh => {:name => "外部LoginID", :description => "外部LoginID"},
  #            }},
  #        :login_mapping => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 30,
  #                :en => {:name => "LoginID Mapping", :description => "LoginID Mapping"},
  #                :zh => {:name => "用户&外部用户映射", :description => "用户&外部用户映射"},
  #            }},
  #        :external_system_member => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 40,
  #                :en => {:name => "External System Members", :description => "External System Members"},
  #                :zh => {:name => "应用系统成员", :description => "在应用系统中添加/移除可访问成员"},
  #            }},
  #    }
  #}
  #====================================END:EXTERNAL_SYSTEM_MANAGEMENT======================================

  #====================================START:LDAP_MANAGEMENT======================================
  map.menu :ldap_management, {
      :en => {:name => "Ldap Setting", :description => "Ldap Setting"},
      :zh => {:name => "LDAP集成", :description => "LDAP集成"},
      :children => {
          :ldap_source => {
              :type => "function",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "LDAP Source", :description => "LDAP Source"},
                  :zh => {:name => "LDAP源", :description => "添加或移除一个LDAP数据源"},
              }},
          :ldap_user => {
              :type => "function",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "LDAP User", :description => "LDAP User"},
                  :zh => {:name => "LDAP用户", :description => "添加或修改LDAP用户认证方案"},
              }},
          #:ldap_organization => {
          #    :type => "function",
          #    :entry => {
          #        :sequence => 30,
          #        :en => {:name => "LDAP Organization", :description => "LDAP Organization"},
          #        :zh => {:name => "LDAP组织", :description => "添加或修改LDAP组织结构同步方案"},
          #    }},
      }
  }
  #====================================END:LDAP_MANAGEMENT======================================

  #====================================START:MAIL_MANAGEMENT======================================
  #map.menu :mail_management, {
  #    :en => {:name => "Mail&Communicate", :description => "Mail&Communicate"},
  #    :zh => {:name => "邮件通信", :description => "邮件通信"},
  #    :children => {
  #        :mail_template => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "Email Template", :description => "Email Template"},
  #                :zh => {:name => "通知模板", :description => "创建或编辑电子邮件通知模板"},
  #            }},
  #        :mail_setting => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 20,
  #                :en => {:name => "Mail Server Configuration", :description => "Mail Server Configuration"},
  #                :zh => {:name => "邮件服务器设置", :description => "平台全局系统邮件服务器设置"},
  #            }},
  #    }
  #}
  #====================================END:MAIL_MANAGEMENT======================================


  #====================================START:BULLETIN_MANAGEMENT======================================
  #map.menu :bulletin_management, {
  #    :en => {:name => "Bulletn", :description => "Bulletin"},
  #    :zh => {:name => "公告管理", :description => "公告管理"},
  #    :children => {
  #        :bulletin_column => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "Bulletin Setting", :description => "Bulletin Setting"},
  #                :zh => {:name => "公告栏目", :description => "添加、编辑公告栏目，或定义栏目的层次结构"},
  #            }},
  #    }
  #}
  #====================================END:BULLETIN_MANAGEMENT======================================

  #====================================START:SECURITY_CONTROL======================================
  map.menu :security_control, {
      :en => {:name => "Security Control", :description => "Security Control"},
      :zh => {:name => "安全控制", :description => "安全控制"},
      :children => {
          :password_policy => {
              :type => "function",
              :entry => {
                  :sequence => 10,
                  :en => {:name => "Password Policy", :description => "Password Policy"},
                  :zh => {:name => "密码策略设置", :description => "修改平台全局密码策略设置"},
              }},
          #:data_access => {
          #    :type => "function",
          #    :entry => {
          #        :sequence => 5,
          #        :en => {:name => "Sharing Setting", :description => "Sharing Setting"},
          #        :zh => {:name => "共享设置", :description => "共享设置"},
          #    }},
          :session_setting => {
              :type => "function",
              :entry => {
                  :sequence => 20,
                  :en => {:name => "Session Setting", :description => "Session Setting"},
                  :zh => {:name => "会话设置", :description => "修改平台全局会话时间"},
              }},
      }
  }
  #====================================END:SECURITY_CONTROL======================================

  #====================================START:CLOUD_MANAGE======================================
  #map.menu :cloud_manage, {
  #    :en => {:name => "Cloud Management", :description => "Cloud Management"},
  #    :zh => {:name => "Cloud管理", :description => "Cloud管理"},
  #    :children => {
  #        :cloud_base_setting => {
  #            :type => "menu",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "Base Setting", :description => "Base Setting"},
  #                :zh => {:name => "基础设置", :description => "基础设置"},
  #            }},
  #        :cloud_operation_setting => {
  #            :type => "menu",
  #            :entry => {
  #                :sequence => 20,
  #                :en => {:name => "Operation Unit ", :description => "Operation Unit "},
  #                :zh => {:name => "运维中心设置", :description => "运维中心设置"},
  #            }},
  #    }
  #}
  #====================================END:CLOUD_MANAGE======================================

  #====================================START:CLOUD_BASE_SETTING======================================
  #map.menu :cloud_base_setting, {
  #    :en => {:name => "Base Setting", :description => "Base Setting"},
  #    :zh => {:name => "基础设置", :description => "基础设置"},
  #    :children => {
  #        :product_module => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "Product Module", :description => "Product Module"},
  #                :zh => {:name => "产品模块", :description => "产品模块"},
  #            }},
  #        :language => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 20,
  #                :en => {:name => "Language", :description => "Language"},
  #                :zh => {:name => "语言", :description => "语言"},
  #            }}
  #    }
  #}
  #====================================END:CLOUD_BASE_SETTING======================================

  #====================================START:CLOUD_OPERATION_SETTING======================================
  #map.menu :cloud_operation_setting, {
  #    :en => {:name => "Operation Unit ", :description => "Operation Unit "},
  #    :zh => {:name => "运维中心设置", :description => "运维中心设置"},
  #    :children => {
  #        :license => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 10,
  #                :en => {:name => "Operation License", :description => "Operation License"},
  #                :zh => {:name => "运维中心License", :description => "更改运维中心License设置"},
  #            }},
  #        :cloud_operation => {
  #            :type => "function",
  #            :entry => {
  #                :sequence => 20,
  #                :en => {:name => "Cloud Operation Unit", :description => "Cloud Operation Unit"},
  #                :zh => {:name => "云运维中心", :description => "查看云运维中心信息"},
  #            }},
  #    }
  #}
  #====================================END:CLOUD_OPERATION_SETTING======================================


  #=================================START:HOME_PAGE=================================
  map.function_group :home_page, {
      :en => {:name => "Home Page", :description => "Home Page"},
      :zh => {:name => "系统主页", :description => "系统主页"}, }
  map.function_group :home_page, {
      :zone_code => "HOME_PAGE",
      :controller => "irm/home",
      :action => "index"}
  map.function_group :home_page, {
      :children => {
          :public_function => {
              :en => {:name => "Public Function", :description => "Public Function"},
              :zh => {:name => "公开功能", :description => "公开功能"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "Y",
              "irm/attach_screenshot" => ["index"],
              "irm/common" => ["edit_password", "forgot_password", "login", "update_password","send_email","reset_pwd","update_pwd"],
              "irm/demo" => ["get_data", "index"],
              "irm/navigations" => ["access_deny", "combo"],
              "irm/oauth_authorize" => ["create", "show", "token"],
              "irm/ratings" => ["create"],
          },
          :login_function => {
              :en => {:name => "Login Accessage Function", :description => "Login Accessage Function"},
              :zh => {:name => "登录可访问功能", :description => "登录可访问功能"},
              :default_flag => "N",
              :login_flag => "Y",
              :public_flag => "N",
              "irm/attachments" => ["create_attachment", "destroy_attachment"],
              "irm/common" => ["create_upload_file", "logout", "search_options", "upload_file", "upload_screen_shot"],
              "irm/list_of_values" => ["lov", "lov_result", "lov_search", "lov_value"],
              "irm/navigations" => ["change_application", "index"],
              "irm/people" => ["info_card"],
              "irm/portlet_configs" => ["save_portal_config", "save_portal_layout"],
              "irm/search" => ["index"],
              "irm/session_settings" => ["timeout_warn"],
              "irm/setting" => ["common"]
          },

          :home_page => {
              :en => {:name => "Home page", :description => "Home page"},
              :zh => {:name => "首页", :description => "首页"},
              :default_flag => "Y",
              :login_flag => "N",
              :public_flag => "N",
              "irm/calendars" => ["get_full_calendar"],
              "irm/home" => ["index", "my_tasks"],
          },
          #:bulletin => {
          #    :en => {:name => "View Bulletin", :description => "View Bulletin"},
          #    :zh => {:name => "公告查看", :description => "公告查看"},
          #    :default_flag => "Y",
          #    :login_flag => "N",
          #    :public_flag => "N",
          #    "irm/bulletins" => ["get_data", "index", "show"],
          #},
          #:edit_bulletin => {
          #    :en => {:name => "Edit Bulletin", :description => "Edit Bulletin"},
          #    :zh => {:name => "编辑公告", :description => "编辑公告"},
          #    :default_flag => "N",
          #    :login_flag => "N",
          #    :public_flag => "N",
          #    "irm/bulletins" => ["edit", "update"],
          #},
          #:new_bulletin => {
          #    :en => {:name => "New Bulletin", :description => "New Bulletin"},
          #    :zh => {:name => "新建公告", :description => "新建公告"},
          #    :default_flag => "N",
          #    :login_flag => "N",
          #    :public_flag => "N",
          #    "irm/bulletins" => ["create", "new"],
          #},
          #:delete_bulletin => {
          #    :en => {:name => "Delete Bulletin", :description => "Delete Bulletin"},
          #    :zh => {:name => "删除公告", :description => "删除公告"},
          #    :default_flag => "N",
          #    :login_flag => "N",
          #    :public_flag => "N",
          #    "irm/bulletins" => ["destroy", "remove_exits_attachments"],
          #}
      }
  }
  #=================================END:HOME_PAGE=================================
  #=================================START:MY_INFO=================================
  map.function_group :my_info, {
      :en => {:name => "Personal Info", :description => "Personal Info"},
      :zh => {:name => "个人信息", :description => "查看我的个人信息"}, }
  map.function_group :my_info, {
      :zone_code => "PERSONAL_SETTING",
      :controller => "irm/my_info",
      :action => "index"}
  map.function_group :my_info, {
      :children => {
          :my_info => {
              :en => {:name => "Personal Info", :description => "Personal Info"},
              :zh => {:name => "个人信息", :description => "个人信息"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/group_members" => ["get_data_from_person"],
              "irm/my_info" => ["edit", "get_my_remote_access", "index", "update"],
              "irm/people" => ["get_owned_external_systems", "get_support_group"],
          },
      }
  }
  #=================================END:MY_INFO=================================

  #=================================START:MY_PASSWORD=================================
  map.function_group :my_password, {
      :en => {:name => "Change Password", :description => "Change Password"},
      :zh => {:name => "修改我的密码", :description => "修改我的密码"}, }
  map.function_group :my_password, {
      :zone_code => "PERSONAL_SETTING",
      :controller => "irm/my_password",
      :action => "index"}
  map.function_group :my_password, {
      :children => {
          :my_password => {
              :en => {:name => "Change Password", :description => "Change Password"},
              :zh => {:name => "修改我的密码", :description => "修改我的密码"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/my_password" => ["edit_password", "index", "update_password"],
          },
      }
  }
  #=================================END:MY_PASSWORD=================================

  #=================================START:MY_AVATAR=================================
  #map.function_group :my_avatar, {
  #    :en => {:name => "Change Avatar", :description => "Change Avatar"},
  #    :zh => {:name => "修改我的头像", :description => "修改我的头像"}, }
  #map.function_group :my_avatar, {
  #    :zone_code => "PERSONAL_SETTING",
  #    :controller => "irm/my_avatar",
  #    :action => "index"}
  #map.function_group :my_avatar, {
  #    :children => {
  #        :my_avatar => {
  #            :en => {:name => "Change Avatar", :description => "Change Avatar"},
  #            :zh => {:name => "修改我的头像", :description => "修改我的头像"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/my_avatar" => ["avatar_crop", "edit", "index", "update"],
  #        },
  #    }
  #}
  #=================================END:MY_AVATAR=================================

  #=================================START:MY_LOGIN_HISTORY=================================
  map.function_group :my_login_history, {
      :en => {:name => "Login Records", :description => "Login Records"},
      :zh => {:name => "我的登录历史", :description => "查看我的登录历史"}, }
  map.function_group :my_login_history, {
      :zone_code => "PERSONAL_SETTING",
      :controller => "irm/my_login_history",
      :action => "index"}
  map.function_group :my_login_history, {
      :children => {
          :my_login_history => {
              :en => {:name => "Login Records", :description => "Login Records"},
              :zh => {:name => "我的登录历史", :description => "我的登录历史"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/my_login_history" => ["get_login_data", "index"],
          },
      }
  }
  #=================================END:MY_LOGIN_HISTORY=================================

  #=================================START:GLOBAL_SETTING=================================
  #map.function_group :global_setting, {
  #    :en => {:name => "Global Setting", :description => "Global Setting"},
  #    :zh => {:name => "全局设置", :description => "更改平台标题、图标、附件上限等全局设置"}, }
  #map.function_group :global_setting, {
  #    :zone_code => "SYSTEM_CUSTOM",
  #    :controller => "irm/global_settings",
  #    :action => "index"}
  #map.function_group :global_setting, {
  #    :children => {
  #        :global_setting => {
  #            :en => {:name => "Manage Global Setting", :description => "Manage Global Setting"},
  #            :zh => {:name => "管理全局设置", :description => "管理全局设置"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/global_settings" => ["crop", "edit", "index", "update"],
  #        },
  #    }
  #}
  #=================================END:GLOBAL_SETTING=================================

  #=================================START:LANGUAGE=================================
  #map.function_group :language, {
  #    :en => {:name => "Language", :description => "Language"},
  #    :zh => {:name => "语言", :description => "语言"}, }
  #map.function_group :language, {
  #    :zone_code => "SYSTEM_CUSTOM",
  #    :controller => "irm/languages",
  #    :action => "index"}
  #map.function_group :language, {
  #    :children => {
  #        :language => {
  #            :en => {:name => "Manage Language", :description => "Manage Language"},
  #            :zh => {:name => "管理语言", :description => "管理语言"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/languages" => ["create", "edit", "get_data", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:LANGUAGE=================================

  #=================================START:LOOKUP_CODE=================================
  #map.function_group :lookup_code, {
  #    :en => {:name => "Lookup Code", :description => "Lookup Code"},
  #    :zh => {:name => "快速编码", :description => "快速编码"}, }
  #map.function_group :lookup_code, {
  #    :zone_code => "SYSTEM_CUSTOM",
  #    :controller => "irm/lookup_types",
  #    :action => "index"}
  #map.function_group :lookup_code, {
  #    :children => {
  #        :lookup_code => {
  #            :en => {:name => "Manage Lookup code", :description => "Manage Lookup code"},
  #            :zh => {:name => "管理快速编码", :description => "管理快速编码"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/lookup_types" => ["add_code", "check_lookup_code", "create", "create_edit_value", "create_value", "edit", "get_lookup_types", "get_lookup_values", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
  #            "irm/lookup_values" => ["create", "edit", "get_data", "get_lookup_values", "index", "multilingual_edit", "multilingual_update", "new", "select_lookup_type", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:LOOKUP_CODE=================================

  #=================================START:PRODUCT_MODULE=================================
  #map.function_group :product_module, {
  #    :en => {:name => "Product Module", :description => "Product Module"},
  #    :zh => {:name => "产品模块", :description => "产品模块"}, }
  #map.function_group :product_module, {
  #    :zone_code => "SYSTEM_CREATE",
  #    :controller => "irm/product_modules",
  #    :action => "index"}
  #map.function_group :product_module, {
  #    :children => {
  #        :product_module => {
  #            :en => {:name => "Manage Product Module", :description => "Manage Product Module"},
  #            :zh => {:name => "管理产品模块", :description => "管理产品模块"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/product_modules" => ["create", "edit", "get_data", "index", "new", "update"],
  #        },
  #    }
  #}
  #=================================END:PRODUCT_MODULE=================================

  #=================================START:APPLICATION=================================
  map.function_group :application, {
      :en => {:name => "Applications", :description => "Applications"},
      :zh => {:name => "应用", :description => "应用"}, }
  map.function_group :application, {
      :zone_code => "SYSTEM_CREATE",
      :controller => "irm/applications",
      :action => "index"}
  map.function_group :application, {
      :children => {
          :application => {
              :en => {:name => "Manage Application", :description => "Manage Application"},
              :zh => {:name => "管理应用", :description => "管理应用"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/applications" => ["create", "edit", "get_data", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
          },
          :edit_filter => {
              :en => {:name => "Edit Filter", :description => "Edit Filter"},
              :zh => {:name => "编辑视图", :description => "编辑视图"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/filters" => ["edit", "new", "create", "update", "index", "operator_value"]
          },

          :view_filter => {
              :en => {:name => "View Filter", :description => "View Filter"},
              :zh => {:name => "查看视图", :description => "查看视图"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/filters" => ["index"]
          }
      }
  }
  #=================================END:APPLICATION=================================


  #=================================START:TAB=================================
  map.function_group :tab, {
      :en => {:name => "Tabs", :description => "Tabs"},
      :zh => {:name => "标签页", :description => "定义或修改标签页"}, }
  map.function_group :tab, {
      :zone_code => "SYSTEM_CREATE",
      :controller => "irm/tabs",
      :action => "index"}
  map.function_group :tab, {
      :children => {
          :tab => {
              :en => {:name => "Manage Tab", :description => "Manage Tab"},
              :zh => {:name => "管理标签页", :description => "管理标签页"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/tabs" => ["create", "edit", "get_data", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
          },
      }
  }
  #=================================END:TAB=================================

  #=================================START:MENU=================================
  #map.function_group :menu, {
  #    :en => {:name => "Menu", :description => "Menu"},
  #    :zh => {:name => "菜单", :description => "定义或修改一个菜单"}, }
  #map.function_group :menu, {
  #    :zone_code => "SYSTEM_CREATE",
  #    :controller => "irm/menus",
  #    :action => "index"}
  #map.function_group :menu, {
  #    :children => {
  #        :menu => {
  #            :en => {:name => "Manage Menu", :description => "Manage Menu"},
  #            :zh => {:name => "管理菜单", :description => "管理菜单"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/menus" => ["create", "edit", "get_data", "index", "multilingual_edit", "multilingual_update", "new", "remove_entry", "show", "update"],
  #            "irm/menu_entries" => ["create", "edit", "get_data", "index", "new", "select_parent", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:MENU=================================

  #=================================START:FUNCTION_GROUP=================================
  #map.function_group :function_group, {
  #    :en => {:name => "Function Group", :description => "Function Group"},
  #    :zh => {:name => "功能组", :description => "定义或修改一个功能组信息"}, }
  #map.function_group :function_group, {
  #    :zone_code => "SYSTEM_CREATE",
  #    :controller => "irm/function_groups",
  #    :action => "index"}
  #map.function_group :function_group, {
  #    :children => {
  #        :function_group => {
  #            :en => {:name => "Manage Function Group", :description => "Manage Function Group"},
  #            :zh => {:name => "管理功能组", :description => "管理功能组"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/function_groups" => ["create", "edit", "get_data", "index", "new", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:FUNCTION_GROUP=================================

  #=================================START:FUNCTION=================================
  #map.function_group :function, {
  #    :en => {:name => "Function", :description => "Function"},
  #    :zh => {:name => "功能", :description => "定义或修改一个功能"}, }
  #map.function_group :function, {
  #    :zone_code => "SYSTEM_CREATE",
  #    :controller => "irm/functions",
  #    :action => "index"}
  #map.function_group :function, {
  #    :children => {
  #        :function => {
  #            :en => {:name => "Manage Function", :description => "Manage Function"},
  #            :zh => {:name => "管理功能", :description => "管理功能"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/functions" => ["add_permissions", "create", "edit", "get_available_permissions", "get_data", "index", "new", "remove_permission", "select_permissions", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:FUNCTION=================================

  #=================================START:PERMISSION=================================
  #map.function_group :permission, {
  #    :en => {:name => "Permission", :description => "Permission"},
  #    :zh => {:name => "权限", :description => "创建、修改权限定义"}, }
  #map.function_group :permission, {
  #    :zone_code => "SYSTEM_CREATE",
  #    :controller => "irm/permissions",
  #    :action => "index"}
  #map.function_group :permission, {
  #    :children => {
  #        :permission => {
  #            :en => {:name => "Manage Permission", :description => "Manage Permission"},
  #            :zh => {:name => "管理权限", :description => "管理权限"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/permissions" => ["create", "data_grid", "edit", "function_get_data", "get_data", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:PERMISSION=================================

  #=================================START:WORKFLOW_MAIL_ALERT=================================
  #map.function_group :workflow_mail_alert, {
  #    :en => {:name => "Mail Alert", :description => "Mail Alert"},
  #    :zh => {:name => "邮件警告", :description => "选择一个邮件模板，定义邮件警告"}, }
  #map.function_group :workflow_mail_alert, {
  #    :zone_code => "SYSTEM_CREATE",
  #    :controller => "irm/wf_mail_alerts",
  #    :action => "index"}
  #map.function_group :workflow_mail_alert, {
  #    :children => {
  #        :workflow_mail_alert => {
  #            :en => {:name => "Manage Mail Alert", :description => "Manage Mail Alert"},
  #            :zh => {:name => "管理邮件警告", :description => "管理邮件警告"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/wf_approval_processes" => ["get_data_by_action"],
  #            "irm/wf_mail_alerts" => ["create", "destroy", "edit", "get_data", "index", "new", "recipient_source", "show", "update"],
  #            "irm/wf_rules" => ["get_data_by_action"],
  #        },
  #    }
  #}
  #=================================END:WORKFLOW_MAIL_ALERT=================================

  #=================================START:PERSON=================================
  map.function_group :person, {
      :en => {:name => "User", :description => "User"},
      :zh => {:name => "用户", :description => "添加或编辑用户，更改用户简档、组织、密码等信息"}, }
  map.function_group :person, {
      :zone_code => "PERSON_MANAGEMENT",
      :controller => "irm/people",
      :action => "index"}
  map.function_group :person, {
      :children => {
          :person => {
              :en => {:name => "Manage User", :description => "Manage User"},
              :zh => {:name => "管理用户", :description => "管理用户"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/people" => ["index", "show","get_data", "get_choose_people","get_support_group", "get_owned_roles","multilingual_edit", "multilingual_update", "add_roles", "remove_role", "select_roles", "get_available_roles"]
          },
          :edit_person_basic_info => {
              :en => {:name => "Edit Basic Info", :description => "Edit Basic Info"},
              :zh => {:name => "更改用户基础信息", :description => "更改用户基础信息"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/people" => ["edit", "update" ]
          },
          :edit_person_email_and_password => {
              :en => {:name => "Edit Email/Password", :description => "Edit Email/Password"},
              :zh => {:name => "更改用户邮箱/密码", :description => "更改用户邮箱/密码"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/people" => ["edit", "update", "reset_password"]
          },
          :edit_person_permission => {
              :en => {:name => "Edit User Permission", :description => "Edit User Permission"},
              :zh => {:name => "更改用户权限", :description => "更改用户权限"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/people" => ["edit", "update"]
          },
          :edit_person_login_name => {
              :en => {:name => "Edit User Login Name", :description => "Edit User Login Name"},
              :zh => {:name => "更改用户登录名", :description => "更改用户登录名"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/people" => ["edit", "update"]
          },
          :manage_user_and_group => {
              :en => {:name => "Manage User And Group", :description => "Manage User And Group"},
              :zh => {:name => "管理用户和组", :description => "管理用户和组"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/group_members" => ["new_from_person", "get_groupable_data", "create_from_person", "get_data_from_person", "delete_from_person"]
          },
          #:manage_user_and_system => {
          #    :en => {:name => "Manage User And System", :description => "Manage User And System"},
          #    :zh => {:name => "管理用户和应用系统", :description => "管理用户和应用系统"},
          #    :default_flag => "N",
          #    :login_flag => "N",
          #    :public_flag => "N",
          #    "irm/external_system_members" => ["new_from_person", "create_from_person", "delete_from_person", "get_available_external_system_data"]
          #},
          :add_person => {
              :en => {:name => "Add New User", :description => "Add New User"},
              :zh => {:name => "新建用户", :description => "新建用户"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/people" => ["new", "create"]
          },
          #:edit_assignment => {
          #    :en => {:name => "Edit Assignment Availability", :description => "Edit Assignment Availability"},
          #    :zh => {:name => "编辑是否分单", :description => "编辑是否分单"},
          #    :default_flag => "N",
          #    :login_flag => "N",
          #    :public_flag => "N"
          #}
      }
  }
  #=================================END:PERSON=================================

  #=================================START:PROFILE=================================
  map.function_group :profile, {
      :en => {:name => "Profile", :description => "Profile"},
      :zh => {:name => "简档", :description => "创建一个简档，或启用/禁用简档中的功能"}, }
  map.function_group :profile, {
      :zone_code => "SYSTEM_SETTING",
      :controller => "irm/profiles",
      :action => "index"}
  map.function_group :profile, {
      :children => {
          :profile => {
              :en => {:name => "Manage Profile", :description => "Manage Profile"},
              :zh => {:name => "管理简档", :description => "管理简档"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/profiles" => ["index", "show", "new", "create", "edit", "update", "get_data", "multilingual_edit", "multilingual_update"],
          },
      }
  }
  #=================================END:PROFILE=================================

  #=================================START:ROLE=================================
  map.function_group :role, {
      :en => {:name => "Role", :description => "Role"},
      :zh => {:name => "角色", :description => "创建一个新角色，或定义您的角色层次结构"}, }
  map.function_group :role, {
      :zone_code => "SYSTEM_SETTING",
      :controller => "irm/roles",
      :action => "index"}
  map.function_group :role, {
      :children => {
          :role => {
              :en => {:name => "Manage Role", :description => "Manage Role"},
              :zh => {:name => "管理角色", :description => "管理角色"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/roles" => ["assignable_people", "create", "edit", "edit_assignment", "index", "multilingual_edit", "multilingual_update", "new", "role_people", "show", "update", "update_assignment","delete_people"],
          },
      }
  }
  #=================================END:ROLE=================================

  #=================================START:GROUP=================================
  #map.function_group :group, {
  #    :en => {:name => "Group", :description => "Group"},
  #    :zh => {:name => "组", :description => "创建或编辑个人用户组"}, }
  #map.function_group :group, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/groups",
  #    :action => "index"}
  #map.function_group :group, {
  #    :children => {
  #        :group => {
  #            :en => {:name => "Manage Group", :description => "Manage Group"},
  #            :zh => {:name => "管理组", :description => "管理组"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/groups" => ["create", "edit", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
  #            #"irm/group_members" => ["create", "create_from_person", "delete", "delete_from_person", "get_data", "get_data_from_person", "get_memberable_data", "new", "new_from_person"],
  #            "irm/group_members" => ["create", "delete", "get_data", "get_memberable_data", "new"],
  #        },
  #        :view_group => {
  #            :en => {:name => "View Group", :description => "View Group"},
  #            :zh => {:name => "查看组", :description => "查看组"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/group_members" => ["get_memberable_data", "get_data", "get_data_from_person"]
  #        }
  #    }
  #}
  #=================================END:GROUP=================================

  #=================================START:OPERATION_UNIT=================================
  #map.function_group :operation_unit, {
  #    :en => {:name => "Operation Unit", :description => "Operation Unit"},
  #    :zh => {:name => "运维中心", :description => "查看现有的运维中心"}, }
  #map.function_group :operation_unit, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/operation_units",
  #    :action => "show"}
  #map.function_group :operation_unit, {
  #    :children => {
  #        :operation_unit => {
  #            :en => {:name => "Manage Operation Unit", :description => "Manage Operation Unit"},
  #            :zh => {:name => "管理运维中心", :description => "管理运维中心"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/operation_units" => ["edit", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:OPERATION_UNIT=================================

  #=================================START:ORGANIZATION=================================
  map.function_group :organization, {
      :en => {:name => "Organization", :description => "Organization"},
      :zh => {:name => "组织", :description => "新建一个组织，或定义组织层次结构"}, }
  map.function_group :organization, {
      :zone_code => "SYSTEM_SETTING",
      :controller => "irm/organizations",
      :action => "index"}
  map.function_group :organization, {
      :children => {
          :organization => {
              :en => {:name => "Manage Organization", :description => "Manage Organization"},
              :zh => {:name => "管理组织", :description => "管理组织"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/organizations" => ["belongs_to", "create", "edit", "get_by_company", "get_data", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
          },
      }
  }
  #=================================END:ORGANIZATION=================================


  #=================================START:SYSTEM=================================
  #map.function_group :system, {
  #    :en => {:name => "External System", :description => "External System"},
  #    :zh => {:name => "应用系统", :description => "新注册一个应用系统，或往系统中添加/移除成员"}, }
  #map.function_group :system, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/external_systems",
  #    :action => "index"}
  #map.function_group :system, {
  #    :children => {
  #        :system => {
  #            :en => {:name => "Manage External System", :description => "Manage External System"},
  #            :zh => {:name => "管理应用系统", :description => "管理应用系统"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/external_systems" => ["add_people", "create", "delete_people", "edit", "get_data", "index", "new", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:SYSTEM=================================
  #=================================START:EXTERNAL_SYSTEM_MEMBER=================================
  #map.function_group :external_system_member, {
  #    :en => {:name => "External System Members", :description => "External System Members"},
  #    :zh => {:name => "应用系统成员", :description => "在应用系统中添加/移除可访问成员"}, }
  #map.function_group :external_system_member, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/external_system_members",
  #    :action => "index"}
  #map.function_group :external_system_member, {
  #    :children => {
  #        :external_system_member => {
  #            :en => {:name => "Manage External System Members", :description => "Manage External System Members"},
  #            :zh => {:name => "管理应用系统成员", :description => "管理应用系统成员"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            #"irm/external_system_members" => ["add_people", "create_from_person", "delete_from_person", "delete_people", "get_available_external_system_data", "get_available_people_data", "get_owned_members_data", "index", "new_from_person"],
  #            "irm/external_system_members" => ["add_people", "delete_people", "get_available_people_data", "get_owned_members_data", "index"],
  #        },
  #    }
  #}
  #=================================END:EXTERNAL_SYSTEM_MEMBER=================================
  #=================================START:LDAP_SOURCE=================================
  map.function_group :ldap_source, {
      :en => {:name => "LDAP Source", :description => "LDAP Source"},
      :zh => {:name => "LDAP源", :description => "添加或移除一个LDAP数据源"}, }
  map.function_group :ldap_source, {
      :zone_code => "SYSTEM_SETTING",
      :controller => "irm/ldap_sources",
      :action => "index"}
  map.function_group :ldap_source, {
      :children => {
          :ldap_source => {
              :en => {:name => "Manage LDAP Source", :description => "Manage LDAP Source"},
              :zh => {:name => "管理LDAP源", :description => "管理LDAP源"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/ldap_sources" => ["active", "create", "edit", "execute_test", "get_data", "index", "new", "show", "update"],
          },
      }
  }
  #=================================END:LDAP_SOURCE=================================

  #=================================START:LDAP_USER=================================
  map.function_group :ldap_user, {
      :en => {:name => "LDAP User", :description => "LDAP User"},
      :zh => {:name => "LDAP用户", :description => "添加或修改LDAP用户认证方案"}, }
  map.function_group :ldap_user, {
      :zone_code => "SYSTEM_SETTING",
      :controller => "irm/ldap_auth_headers",
      :action => "index"}
  map.function_group :ldap_user, {
      :children => {
          :ldap_user => {
              :en => {:name => "Manage LDAP User", :description => "Manage LDAP User"},
              :zh => {:name => "管理LDAP用户", :description => "管理LDAP用户"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/ldap_auth_attributes" => ["create", "destroy", "edit", "get_data", "index", "new", "show", "update"],
              "irm/ldap_auth_headers" => ["create", "edit", "get_by_ldap_source", "get_data", "index", "new", "show", "update","sync","get_ldap_data"],
              "irm/ldap_auth_rules" => ["create", "destroy", "edit", "get_data", "index", "new", "show", "update","switch_sequence"]
          },
      }
  }
  #=================================END:LDAP_USER=================================

  #=================================START:LDAP_ORGANIZATION=================================
  #map.function_group :ldap_organization, {
  #    :en => {:name => "LDAP Organization", :description => "LDAP Organization"},
  #    :zh => {:name => "LDAP组织", :description => "添加或修改LDAP组织结构同步方案"}, }
  #map.function_group :ldap_organization, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/ldap_syn_headers",
  #    :action => "index"}
  #map.function_group :ldap_organization, {
  #    :children => {
  #        :ldap_organization => {
  #            :en => {:name => "Manage LDAP Organization", :description => "Manage LDAP Organization"},
  #            :zh => {:name => "管理LDAP组织", :description => "管理LDAP组织"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/ldap_auth_headers" => ["get_by_ldap_source"],
  #            "irm/ldap_syn_attributes" => ["create", "edit", "index", "new", "show", "update","get_data"],
  #            "irm/ldap_syn_headers" => ["active", "create", "edit", "index", "new", "show", "update", "get_data"],
  #        },
  #    }
  #}
  #=================================END:LDAP_ORGANIZATION=================================

  #=================================START:MAIL_TEMPLATE=================================
  #map.function_group :mail_template, {
  #    :en => {:name => "Email Template", :description => "Email Template"},
  #    :zh => {:name => "通知模板", :description => "创建或编辑电子邮件通知模板"}, }
  #map.function_group :mail_template, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/mail_templates",
  #    :action => "index"}
  #map.function_group :mail_template, {
  #    :children => {
  #        :mail_template => {
  #            :en => {:name => "Manage Email Template", :description => "Manage Email Template"},
  #            :zh => {:name => "管理邮件模板", :description => "管理邮件模板"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/mail_templates" => ["create", "edit", "get_data", "get_mail_templates", "get_script_context_fields", "index", "new", "show", "update"],
  #            "irm/object_attributes" => ["all_columns"],
  #        },
  #    }
  #}
  #=================================END:MAIL_TEMPLATE=================================

  #=================================START:MONITOR_DELAYED_JOBS=================================
  #map.function_group :monitor_delayed_jobs, {
  #    :en => {:name => "Monitor Delayed Jobs", :description => "Monitor Delayed Jobs"},
  #    :zh => {:name => "Delayed Job运行记录", :description => "监控Delayed Job运行记录"}, }
  #map.function_group :monitor_delayed_jobs, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/delayed_jobs",
  #    :action => "index"}
  #map.function_group :monitor_delayed_jobs, {
  #    :children => {
  #        :monitor_delayed_jobs => {
  #            :en => {:name => "Manage Monitor Delayed Jobs", :description => "Manage Monitor Delayed Jobs"},
  #            :zh => {:name => "管理Delayed Job运行记录", :description => "管理Delayed Job运行记录"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/delayed_jobs" => ["get_data", "get_item_data", "index", "ir_rule_process_monitor", "item_list", "item_view", "wf_process_job_monitor"],
  #        },
  #    }
  #}
  #=================================END:MONITOR_DELAYED_JOBS=================================


  #=================================START:BULLETIN_SETTING=================================
  #map.function_group :bulletin_setting, {
  #    :en => {:name => "Bulletin Setting", :description => "Bulletin Setting"},
  #    :zh => {:name => "公告设置", :description => "修改公告系统参数设置"}, }
  #map.function_group :bulletin_setting, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/bulletins",
  #    :action => "index"}
  #map.function_group :bulletin_setting, {
  #    :children => {
  #    }
  #}
  #=================================END:BULLETIN_SETTING=================================

  #=================================START:BULLETIN_COLUMN=================================
  #map.function_group :bulletin_column, {
  #    :en => {:name => "Bulletin Setting", :description => "Bulletin Setting"},
  #    :zh => {:name => "公告栏目", :description => "添加、编辑公告栏目，或定义栏目的层次结构"}, }
  #map.function_group :bulletin_column, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/bu_columns",
  #    :action => "index"}
  #map.function_group :bulletin_column, {
  #    :children => {
  #        :bulletin_column => {
  #            :en => {:name => "Manage Bulletin Columns", :description => "Manage Bulletin Columns"},
  #            :zh => {:name => "管理公告栏目", :description => "管理公告栏目"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/bu_columns" => ["create", "edit", "get_columns_data", "index", "new", "update"],
  #        },
  #    }
  #}
  #=================================END:BULLETIN_COLUMN=================================


  #=================================START:PASSWORD_POLICY=================================
  map.function_group :password_policy, {
      :en => {:name => "Password Policy", :description => "Password Policy"},
      :zh => {:name => "密码策略设置", :description => "修改平台全局密码策略设置"}, }
  map.function_group :password_policy, {
      :zone_code => "SYSTEM_SETTING",
      :controller => "irm/password_policies",
      :action => "index"}
  map.function_group :password_policy, {
      :children => {
          :password_policy => {
              :en => {:name => "Manage Password Policy", :description => "Manage Password Policy"},
              :zh => {:name => "管理密码策略", :description => "管理密码策略"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/password_policies" => ["index", "update"],
          },
      }
  }
  #=================================END:PASSWORD_POLICY=================================

  #=================================START:LICENSE=================================
  #map.function_group :license, {
  #    :en => {:name => "Operation License", :description => "Operation License"},
  #    :zh => {:name => "运维中心License", :description => "更改运维中心License设置"}, }
  #map.function_group :license, {
  #    :zone_code => "CLOUD_SETTING",
  #    :controller => "irm/licenses",
  #    :action => "index"}
  #map.function_group :license, {
  #    :children => {
  #        :license => {
  #            :en => {:name => "Operation License", :description => "Operation License"},
  #            :zh => {:name => "运维中心License", :description => "运维中心License"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/licenses" => ["create", "edit", "get_data", "index", "multilingual_edit", "multilingual_update", "new", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:LICENSE=================================

  #=================================START:CLOUD_OPERATION=================================
  #map.function_group :cloud_operation, {
  #    :en => {:name => "Cloud Operation Unit", :description => "Cloud Operation Unit"},
  #    :zh => {:name => "云运维中心", :description => "查看云运维中心信息"}, }
  #map.function_group :cloud_operation, {
  #    :zone_code => "CLOUD_SETTING",
  #    :controller => "irm/cloud_operations",
  #    :action => "index"}
  #map.function_group :cloud_operation, {
  #    :children => {
  #        :cloud_operation => {
  #            :en => {:name => "Cloud Operation Unit", :description => "Cloud Operation Unit"},
  #            :zh => {:name => "云运维中心", :description => "云运维中心"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/cloud_operations" => ["edit", "get_data", "index", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:CLOUD_OPERATION=================================

  #=================================START:MY_PROFILE=================================
  map.function_group :my_profile, {
      :en => {:name => "My Profile", :description => "My Profile"},
      :zh => {:name => "我的简档", :description => "我的简档"}, }
  map.function_group :my_profile, {
      :zone_code => "PERSONAL_SETTING",
      :controller => "irm/my_profiles",
      :action => "index"}
  map.function_group :my_profile, {
      :children => {
          :my_profile => {
              :en => {:name => "My Profile", :description => "My Profile"},
              :zh => {:name => "我的简档", :description => "我的简档"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/my_profiles" => ["index"],
          },
      }
  }
  #=================================END:MY_PROFILE=================================

  #=================================START:MAIL_SETTING=================================
  #map.function_group :mail_setting, {
  #    :en => {:name => "Mail Server Configuration", :description => "Mail Server Configuration"},
  #    :zh => {:name => "邮件服务器设置", :description => "平台全局系统邮件服务器设置"}, }
  #map.function_group :mail_setting, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/mail_settings",
  #    :action => "index"}
  #map.function_group :mail_setting, {
  #    :children => {
  #        :view_mail_setting => {
  #            :en => {:name => "View Mail Server", :description => "View Mail Server"},
  #            :zh => {:name => "查看邮件服务器信息", :description => "查看邮件服务器信息"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/mail_settings" => ["index"],
  #        },
  #        :edit_mail_setting => {
  #            :en => {:name => "Edit Mail Server Configuration", :description => "Edit Mail Server Configuration"},
  #            :zh => {:name => "编辑邮件服务器配置", :description => "编辑邮件服务器配置"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/mail_settings" => ["edit", "update"],
  #        },
  #    }
  #}
  #=================================END:MAIL_SETTING=================================

  #=================================START:REPORT_REQUEST_HISTORY=================================
  #map.function_group :report_request_history, {
  #    :en => {:name => "Report Request History", :description => "Report Request History"},
  #    :zh => {:name => "报表运行历史", :description => "查看报表运行的明细历史记录"}, }
  #map.function_group :report_request_history, {
  #    :zone_code => "IRM_REPORT",
  #    :controller => "irm/report_request_histories",
  #    :action => "index"}
  #map.function_group :report_request_history, {
  #    :children => {
  #        :report_request_history => {
  #            :en => {:name => "Report Request History", :description => "Report Request History"},
  #            :zh => {:name => "报表运行历史", :description => "查看报表运行的明细历史记录"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/report_request_histories" => ["get_data", "index"],
  #        },
  #    }
  #}
  #=================================END:REPORT_REQUEST_HISTORY=================================


  #=================================START:SESSION_SETTING=================================
  map.function_group :session_setting, {
      :en => {:name => "Session Setting", :description => "Session Setting"},
      :zh => {:name => "会话设置", :description => "修改平台全局会话时间"}, }
  map.function_group :session_setting, {
      :zone_code => "SYSTEM_SETTING",
      :controller => "irm/session_settings",
      :action => "index"}
  map.function_group :session_setting, {
      :children => {
          :session_setting => {
              :en => {:name => "Manage Session", :description => "Manage Session"},
              :zh => {:name => "会话设置", :description => "会话设置"},
              :default_flag => "N",
              :login_flag => "N",
              :public_flag => "N",
              "irm/session_settings" => ["index", "update"],
          },
      }
  }
  #=================================END:SESSION_SETTING=================================

  #=================================START:ORGANIZATION_INFO=================================
  #map.function_group :organization_info, {
  #    :en => {:name => "Organization Info", :description => "Organization Info"},
  #    :zh => {:name => "组织信息", :description => "新建、查看、编辑一组织信息"}, }
  #map.function_group :organization_info, {
  #    :zone_code => "SYSTEM_SETTING",
  #    :controller => "irm/organization_infos",
  #    :action => "index"}
  #map.function_group :organization_info, {
  #    :children => {
  #        :organization_info => {
  #            :en => {:name => "Manage Organization Info", :description => "Manage Organization Info"},
  #            :zh => {:name => "管理组织信息", :description => "管理组织信息"},
  #            :default_flag => "N",
  #            :login_flag => "N",
  #            :public_flag => "N",
  #            "irm/organization_infos" => ["create", "delete_attachment", "edit", "get_data", "index", "new", "show", "update"],
  #        },
  #    }
  #}
  #=================================END:ORGANIZATION_INFO=================================

end