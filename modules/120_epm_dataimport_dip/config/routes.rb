Ironmine::Application.routes.draw do

  scope :module => "dip" do

    match '/template(/index)(.:format)' => "template#index", :via => :get
    match '/template/edit(.:format)' => "template#edit", :via => :get
    match '/template/show(.:format)' => "template#show", :via => :get
    match '/template/import(.:format)' => "template#import", :via => :get
    match '/template/export(.:format)' => "template#export", :via => :get
    match '/template/export_data(.:format)' => "template#export_data", :via => :get
    match '/template/new(.:format)' => "template#new", :via => :get
    match '/template/update(.:format)' => "template#update", :via => :put
    match '/template/destroy(.:format)' => "template#destroy", :via => :get
    match '/template/get_data(.:format)' => "template#get_data", :via => :get
    match '/template/get_data_authorized(.:format)' => "template#get_data_authorized", :via => :get
    match '/template/create(.:format)' => "template#create", :via => :post
    match '/template/upload(.:format)' => "template#upload", :via => :post
    match '/template/setting(.:format)' => "template#setting", :via => :get
    match '/template/query(.:format)' => "template#query", :via => :get
    match '/template/get_query_data(.:format)' => "template#get_query_data", :via => :get
    match '/template/next_value_list(.:format)' => "template#next_value_list", :via => :post
    match '/template/get_category_template(.:format)' => "template#get_category_template", :via => :get
    match '/template/get_ahead_data(.:format)' => "template#get_ahead_data", :via => :get
    match '/template/save_data(.:format)' => "template#save_data", :via => :post
    match '/template/can_create_data(.:format)' => "template#can_create_data", :via => :post
    match '/template/submit_data(.:format)' => "template#submit_data", :via => :post

    match '/template_column/get_data(.:format)' => "template_column#get_data", :via => :get
    match '/template_column/new(.:format)' => "template_column#new", :via => :get
    match '/template_column/edit(.:format)' => "template_column#edit", :via => :get
    match '/template_column/create(.:format)' => "template_column#create", :via => :post
    match '/template_column/update(.:format)' => "template_column#update", :via => :post
    match '/template_column/destroy(.:format)' => "template_column#destroy", :via => :post
    match '/template_column/reorder(.:format)' => "template_column#reorder", :via => :post
    ###
    match '/validation(/index)(.:format)' => "validation#index", :via => :get
    match '/validation/get_data(.:format)' => "validation#get_data", :via => :get
    match '/validation/new(.:format)' => "validation#new", :via => :get
    match '/validation/edit(.:format)' => "validation#edit", :via => :get
    match '/validation/create(.:format)' => "validation#create", :via => :post
    match '/validation/update(.:format)' => "validation#update", :via => :put
    match '/validation/destroy(.:format)' => "validation#destroy", :via => :get
    ##
    match '/template_validation(/index)(.:format)' => "template_validation#index", :via => :get
    match '/template_validation/get_data(.:format)' => "template_validation#get_data", :via => :get
    match '/template_validation/new(.:format)' => "template_validation#new", :via => :get
    match '/template_validation/edit(.:format)' => "template_validation#edit", :via => :get
    match '/template_validation/create(.:format)' => "template_validation#create", :via => :post
    match '/template_validation/update(.:format)' => "template_validation#update", :via => :post
    match '/template_validation/destroy(.:format)' => "template_validation#destroy", :via => :post

    match '/import_management/get_data(.:format)' => "import_management#get_data", :via => :get
    match '/import_management(/index)(.:format)' => "import_management#index", :via => :get
    match '/import_management/destroy(.:format)' => "import_management#destroy", :via => :get
    match '/import_management/query(.:format)' => "import_management#query", :via => :get
    match '/import_management/get_query_data(.:format)' => "import_management#get_query_data", :via => :get
    match '/import_management/export_data(.:format)' => "import_management#export_data", :via => :get

    match '/error/get_data(.:format)' => "error#get_data", :via => :get
    match '/error(/index)(.:format)' => "error#index", :via => :get

    match '/combination(/index)(.:format)' => "combination#index", :via => :get
    match '/combination/create(.:format)' => "combination#create", :via => :post
    match '/combination/get_data(.:format)' => "combination#get_data", :via => :get
    match '/combination/destroy(.:format)' => "combination#destroy", :via => :post
    match '/combination/enable(.:format)' => "combination#enable", :via => :post
    match '/combination/in_process(.:format)' => "combination#in_process", :via => :post
    match '/combination/close(.:format)' => "combination#close", :via => :post
    match '/combination/rename(.:format)' => "combination#rename", :via => :post
    match '/combination/delete(.:format)' => "combination#delete", :via => :post
    match '/combination/getHeaderList(.:format)' => "combination#getHeaderList", :via => :get

    match '/header_value(/index)(.:format)' => "header_value#index", :via => :get
    match '/header_value/get_data(.:format)' => "header_value#get_data", :via => :get
    match '/header_value/create(.:format)' => "header_value#create", :via => :post
    match '/header_value/update(.:format)' => "header_value#update", :via => :post
    match '/header_value/destroy(.:format)' => "header_value#destroy", :via => :post
    match '/header_value/enable(.:format)' => "header_value#enable", :via => :post
    match '/header_value/disable(.:format)' => "header_value#disable", :via => :post
    match '/header_value/sync_value(.:format)' => "header_value#sync_value", :via => :post

    match '/header/create(.:format)' => "header#create", :via => :post
    match '/header/update(.:format)' => "header#update", :via => :post
    match '/header/destroy(.:format)' => "header#destroy", :via => :get
    match '/header/get_data(.:format)' => "header#get_data", :via => :get
    match '/header/get_header(.:format)' => "header#get_header", :via => :get

    match '/odi_server(/index)(.:format)' => "odi_server#index", :via => :get
    match '/odi_server/create(.:format)' => "odi_server#create", :via => :post
    match '/odi_server/destroy(.:format)' => "odi_server#destroy", :via => :post
    match '/odi_server/update(.:format)' => "odi_server#update", :via => :post
    match '/odi_server/get_data(.:format)' => "odi_server#get_data", :via => :get
    match '/odi_server/get_edit_data(.:format)' => "odi_server#get_edit_data", :via => :get

    match '/odi10_server(/index)(.:format)' => "odi10_server#index", :via => :get
    match '/odi10_server/create(.:format)' => "odi10_server#create", :via => :post
    match '/odi10_server/destroy(.:format)' => "odi10_server#destroy", :via => :post
    match '/odi10_server/update(.:format)' => "odi10_server#update", :via => :post
    match '/odi10_server/get_data(.:format)' => "odi10_server#get_data", :via => :get
    match '/odi10_server/get_edit_data(.:format)' => "odi10_server#get_edit_data", :via => :get

    match '/dip_report(/index)(.:format)' => "dip_report#index", :via => :get
    match '/dip_report/query(.:format)' => "dip_report#query", :via => :get
    match '/dip_report/new(.:format)' => "dip_report#new", :via => :get
    match '/dip_report/get_data(.:format)' => "dip_report#get_data", :via => :get
    match '/dip_report/edit(.:format)' => "dip_report#edit", :via => :get
    match '/dip_report/update(.:format)' => "dip_report#update", :via => :put
    match '/dip_report/create(.:format)' => "dip_report#create", :via => :post
    match '/dip_report/destroy(.:format)' => "dip_report#destroy", :via => :get
    match '/dip_report/show(.:format)' => "dip_report#show", :via => :get
    match '/dip_report/export(.:format)' => "dip_report#export", :via => :get
    match '/dip_report/get_data_authorized(.:format)' => "dip_report#get_data_authorized", :via => :get
    match '/dip_report/get_report_data(.:format)' => "dip_report#get_report_data", :via => :get

    match '/dip_category/get_tree_data(.:format)' => "dip_category#get_tree_data", :via => :get
    match '/dip_category/get_type_tree_data(.:format)' => "dip_category#get_type_tree_data", :via => :get
    match '/dip_category/get_data(.:format)' => "dip_category#get_data", :via => :get
    match '/dip_category(/index)(.:format)' => "dip_category#index", :via => :get
    match '/dip_category/create(.:format)' => "dip_category#create", :via => :post
    match '/dip_category/update(.:format)' => "dip_category#update", :via => :post
    match '/dip_category/destroy(.:format)' => "dip_category#destroy", :via => :get
    match '/dip_category/get_category_list(.:format)' => "dip_category#get_category_list", :via => :get

    match '/dip_authority/add_odi_authority(.:format)' => "dip_authority#add_odi_authority", :via => :post
    match '/dip_authority/get_authorized_odi(.:format)' => "dip_authority#get_authorized_odi", :via => :get
    match '/dip_authority/get_unauthorized_odi(.:format)' => "dip_authority#get_unauthorized_odi", :via => :get
    match '/dip_authority/add_infa_authority(.:format)' => "dip_authority#add_infa_authority", :via => :post
    match '/dip_authority/get_authorized_infa(.:format)' => "dip_authority#get_authorized_infa", :via => :get
    match '/dip_authority/get_unauthorized_infa(.:format)' => "dip_authority#get_unauthorized_infa", :via => :get
    match '/dip_authority/add_report_authority(.:format)' => "dip_authority#add_report_authority", :via => :post
    match '/dip_authority/get_authorized_report(.:format)' => "dip_authority#get_authorized_report", :via => :get
    match '/dip_authority/get_unauthorized_report(.:format)' => "dip_authority#get_unauthorized_report", :via => :get
    match '/dip_authority/add_template_authority(.:format)' => "dip_authority#add_template_authority", :via => :post
    match '/dip_authority/get_unauthorized_template(.:format)' => "dip_authority#get_unauthorized_template", :via => :get
    match '/dip_authority/get_authorized_template(.:format)' => "dip_authority#get_authorized_template", :via => :get
    match '/dip_authority/destroy_authorized(.:format)' => "dip_authority#destroy_authorized", :via => :post
    match '/dip_authority/add_value_authority(.:format)' => "dip_authority#add_value_authority", :via => :post
    match '/dip_authority/get_unauthorized_value(.:format)' => "dip_authority#get_unauthorized_value", :via => :get
    match '/dip_authority/get_authorized_value(.:format)' => "dip_authority#get_authorized_value", :via => :get
    match '/dip_authority/get_tree_data(.:format)' => "dip_authority#get_tree_data", :via => :get
    match '/dip_authority(/index)(.:format)' => "dip_authority#index", :via => :get

    match '/parameter_set/odi_index(.:format)' => "parameter_set#odi_index", :via => :get
    match '/parameter_set/infa_index(.:format)' => "parameter_set#infa_index", :via => :get
    match '/parameter_set/report_index(.:format)' => "parameter_set#report_index", :via => :get
    match '/parameter_set/edit(.:format)' => "parameter_set#edit", :via => :post
    match '/parameter_set/get_data(.:format)' => "parameter_set#get_data", :via => :get
    match '/parameter_set/destroy(.:format)' => "parameter_set#destroy", :via => :post
    match '/parameter_set/create(.:format)' => "parameter_set#create", :via => :post
    match '/parameter_set/get_parameter_data(.:format)' => "parameter_set#get_parameter_data", :via => :get
    match '/parameter_set/add_parameter(.:format)' => "parameter_set#add_parameter", :via => :post

    match '/parameter/odi_parameter(.:format)' => "parameter#odi_parameter", :via => :get
    match '/parameter/infa_parameter(.:format)' => "parameter#infa_parameter", :via => :get
    match '/parameter/report_parameter(.:format)' => "parameter#report_parameter", :via => :get
    match '/parameter/update(.:format)' => "parameter#update", :via => :post
    match '/parameter/get_odi_parameter(.:format)' => "parameter#get_odi_parameter", :via => :get
    match '/parameter/get_infa_parameter(.:format)' => "parameter#get_infa_parameter", :via => :get
    match '/parameter/get_report_parameter(.:format)' => "parameter#get_report_parameter", :via => :get
    match '/parameter/destroy(.:format)' => "parameter#destroy", :via => :post
    match '/parameter/create(.:format)' => "parameter#create", :via => :post

    match '/infa_repository(/index)(.:format)' => "infa_repository#index", :via => :get
    match '/infa_repository/update(.:format)' => "infa_repository#update", :via => :post
    match '/infa_repository/get_data(.:format)' => "infa_repository#get_data", :via => :get
    match '/infa_repository/destroy(.:format)' => "infa_repository#destroy", :via => :post
    match '/infa_repository/create(.:format)' => "infa_repository#create", :via => :post
    match '/infa_repository/get_repository_info(.:format)' => "infa_repository#get_repository_info", :via => :post
    match '/infa_repository/synch(.:format)' => "infa_repository#synch", :via => :post

    match '/infa_workflow(/index)(.:format)' => "infa_workflow#index", :via => :get
    match '/infa_workflow/get_data(.:format)' => "infa_workflow#get_data", :via => :get
    match '/infa_workflow/destroy(.:format)' => "infa_workflow#destroy", :via => :post
    match '/infa_workflow/create(.:format)' => "infa_workflow#create", :via => :post
    match '/infa_workflow/update(.:format)' => "infa_workflow#update", :via => :post
    match '/infa_workflow/run(.:format)' => "infa_workflow#run", :via => :get
    match '/infa_workflow/run_workflow(.:format)' => "infa_workflow#run_workflow", :via => :post
    match '/infa_workflow/bind_parameter_set(.:format)' => "infa_workflow#bind_parameter_set", :via => :post
    match '/infa_workflow/get_run_data(.:format)' => "infa_workflow#get_run_data", :via => :get
    match '/infa_workflow/get_run_status(.:format)' => "infa_workflow#get_run_status", :via => :get
    match '/infa_workflow/get_parameter_set(.:format)' => "infa_workflow#get_parameter_set", :via => :get
    match '/infa_workflow/get_authorized_workflow(.:format)' => "infa_workflow#get_authorized_workflow", :via => :get
    match '/infa_workflow/get_param(.:format)' => "infa_workflow#get_param", :via => :get

    match '/odi_interface(/index)(.:format)' => "odi_interface#index", :via => :get
    match '/odi_interface/update(.:format)' => "odi_interface#update", :via => :post
    match '/odi_interface/create(.:format)' => "odi_interface#create", :via => :post
    match '/odi_interface/destroy(.:format)' => "odi_interface#destroy", :via => :get
    match '/odi_interface/run(.:format)' => "odi_interface#run", :via => :post
    match '/odi_interface/run_interface(.:format)' => "odi_interface#run_interface", :via => :get
    match '/odi_interface/get_run_data(.:format)' => "odi_interface#get_run_data", :via => :get
    match '/odi_interface/query_status(.:format)' => "odi_interface#query_status", :via => :get
    match '/odi_interface/get_interface(.:format)' => "odi_interface#get_interface", :via => :get
    match '/odi_interface/get_param(.:format)' => "odi_interface#get_param", :via => :get
    match '/odi_interface/get_data(.:format)' => "odi_interface#get_data", :via => :get
    match '/odi_interface/get_parameter_set(.:format)' => "odi_interface#get_parameter_set", :via => :get
    match '/odi_interface/bind_parameter_set(.:format)' => "odi_interface#bind_parameter_set", :via => :post

    match '/approval_status(/index)(.:format)' => "approval_status#index", :via => :get
    match '/approval_status/get_data(.:format)' => "approval_status#get_data", :via => :get
    match '/approval_status/manage(.:format)' => "approval_status#manage", :via => :get
    match '/approval_status/get_manage_data(.:format)' => "approval_status#get_manage_data", :via => :get

    match '/approval_node/get_data(.:format)' => "approval_node#get_data", :via => :get
    match '/approval_node/approval_agree(.:format)' => "approval_node#approval_agree", :via => :post
    match '/approval_node/approval_reject(.:format)' => "approval_node#approval_reject", :via => :post
    match '/approval_node/approval_reset(.:format)' => "approval_node#approval_reset", :via => :post
  end

end
