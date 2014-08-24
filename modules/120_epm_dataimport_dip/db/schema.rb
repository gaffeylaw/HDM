ActiveRecord::Schema.define(:version => 20120930111111) do

  #create_table "chm_advisory_board_members", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "advisory_board_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_advisory_board_members, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_advisory_board_members", ["advisory_board_id", "person_id"], :name => "CHM_ADVISORY_BOARD_MEMBERS_U1", :unique => true
  #
  #
  #create_table "chm_advisory_boards", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.string "name", :limit => 150, :null => true
  #  t.string "description", :limit => 240
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_advisory_boards, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_advisory_boards", ["code", "opu_id"], :name => "CHM_ADVISORY_BOARDS_U1"
  #
  #
  #create_table "chm_change_approvals", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_request_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "send_at"
  #  t.string "approve_status", :limit => 30, :null => true
  #  t.string "comment", :limit => 240
  #  t.datetime "approve_at"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_approvals, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_approvals", ["change_request_id", "person_id"], :name => "CHM_CHANGE_APPROVALS_U1", :unique => true
  #
  #
  #create_table "chm_change_config_relations", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "change_request_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "config_item_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_config_relations, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_config_relations", ["change_request_id", "config_item_id"], :name => "CHM_CHANGE_CONFIG_RELATIONS_U1", :unique => true
  #
  #
  #create_table "chm_change_impacts", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.integer "weight_values"
  #  t.integer "display_sequence", :default => 10
  #  t.string "default_flag", :limit => 1, :default => "N", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_impacts, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_impacts", ["code"], :name => "CHM_CHANGE_IMPACTS_N1"
  #
  #
  #create_table "chm_change_impacts_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_impact_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_impacts_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_impacts_tl", ["change_impact_id", "language"], :name => "CHM_CHANGE_IMPACTS_TL_U1", :unique => true
  #add_index "chm_change_impacts_tl", ["change_impact_id"], :name => "CHM_CHANGE_IMPACTS_TL_N1"
  #
  #
  #create_table "chm_change_incident_relations", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "change_request_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "incident_request_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "create_flag", :limit => 1, :default => "N", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_incident_relations, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_incident_relations", ["change_request_id", "incident_request_id"], :name => "CHM_CHG_ICDT_RELATIONS_U1", :unique => true
  #
  #
  #create_table "chm_change_journals", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_request_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "reply_type", :limit => 30
  #  t.string "replied_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.text "message_body", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_journals, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_journals", ["change_request_id"], :name => "CHM_CHANGE_JOURNALS_N1"
  #add_index "chm_change_journals", ["replied_by"], :name => "CHM_CHANGE_JOURNALS_N2"
  #
  #
  #create_table "chm_change_plan_types", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.integer "display_sequence", :default => 10
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_plan_types, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_plan_types", ["code"], :name => "CHM_CHANGE_PLAN_TYPES_N1"
  #
  #
  #create_table "chm_change_plan_types_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_plan_type_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_plan_types_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_plan_types_tl", ["change_plan_type_id", "language"], :name => "CHM_CHANGE_PLAN_TYPES_TL_U1", :unique => true
  #add_index "chm_change_plan_types_tl", ["change_plan_type_id"], :name => "CHM_CHANGE_PLAN_TYPES_TL_N1"
  #
  #
  #create_table "chm_change_plans", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "change_request_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_plan_type_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "planed_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.text "plan_body"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_plans, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_plans", ["change_request_id", "change_plan_type_id"], :name => "CHM_CHANGE_PLANS_TL_U1", :unique => true
  #
  #
  #create_table "chm_change_priorities", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.integer "weight_values"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_priorities, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_priorities", ["code"], :name => "CHM_CHANGE_PRIORITIES_N1"
  #
  #
  #create_table "chm_change_priorities_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_priority_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_priorities_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_priorities_tl", ["change_priority_id", "language"], :name => "CHM_CHANGE_PRIORITIES_TL_U1", :unique => true
  #add_index "chm_change_priorities_tl", ["change_priority_id"], :name => "CHM_CHANGE_PRIORITIES_TL_N1"
  #
  #
  #create_table "chm_change_requests", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "request_number"
  #  t.string "title", :limit => 150, :null => true
  #  t.text "summary", :null => true
  #  t.string "requested_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "organization_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "submitted_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "submitted_date", :null => true
  #  t.datetime "close_date"
  #  t.string "contact_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "contact_number", :limit => 30
  #  t.string "external_system_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "sub_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "request_type", :limit => 30
  #  t.string "change_status_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_priority_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_impact_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_urgency_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "support_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "support_person_id", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "plan_start_date"
  #  t.datetime "plan_end_date"
  #  t.string "approve_status", :limit => 30
  #  t.string "incident_request_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_requests, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "chm_change_statuses", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.integer "display_sequence", :default => 10
  #  t.string "display_color", :limit => 7
  #  t.string "default_flag", :limit => 1, :default => "N", :null => true
  #  t.string "close_flag", :limit => 1, :default => "N", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_statuses, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_statuses", ["code"], :name => "CHM_CHANGE_STATUSES_N1"
  #
  #
  #create_table "chm_change_statuses_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_status_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_statuses_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_statuses_tl", ["change_status_id", "language"], :name => "CHM_CHANGE_STATUSES_TL_U1", :unique => true
  #add_index "chm_change_statuses_tl", ["change_status_id"], :name => "CHM_CHANGE_STATUSES_TL_N1"
  #
  #
  #create_table "chm_change_task_depends", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "change_task_id", :limit => 60, :null => true
  #  t.string "depend_task_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_task_depends, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_task_depends", ["change_task_id", "depend_task_id"], :name => "CHM_CHANGE_TASK_DEPENDS_U1", :unique => true
  #
  #
  #create_table "chm_change_task_phases", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.integer "display_sequence", :default => 10
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_task_phases, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_task_phases", ["code"], :name => "CHM_CHANGE_TASK_PHASES_N1"
  #
  #
  #create_table "chm_change_task_phases_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_task_phase_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_task_phases_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_task_phases_tl", ["change_task_phase_id", "language"], :name => "CHM_CHANGE_TASK_PHASES_TL_U1", :unique => true
  #add_index "chm_change_task_phases_tl", ["change_task_phase_id"], :name => "CHM_CHANGE_TASK_PHASES_TL_N1"
  #
  #
  #create_table "chm_change_task_templates", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_task_templates, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_task_templates", ["code"], :name => "CHM_CHANGE_TASK_TEMPLATES_N1"
  #
  #
  #create_table "chm_change_task_templates_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_task_template_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_task_templates_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_task_templates_tl", ["change_task_template_id", "language"], :name => "CHM_CHG_TASK_TEMPLATES_TL_U1", :unique => true
  #add_index "chm_change_task_templates_tl", ["change_task_template_id"], :name => "CHM_CHG_TASK_TEMPLATES_TL_N1"
  #
  #
  #create_table "chm_change_tasks", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "source_type", :limit => 60, :null => true
  #  t.string "source_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "change_task_phase_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "support_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "support_person_id", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "plan_start_date"
  #  t.datetime "plan_end_date"
  #  t.datetime "start_date"
  #  t.datetime "end_date"
  #  t.string "name", :limit => 150, :null => true
  #  t.text "message"
  #  t.text "description"
  #  t.string "status", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_tasks, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_tasks", ["source_type", "source_id"], :name => "CHM_CHANGE_TASKS_N1"
  #
  #
  #create_table "chm_change_urgencies", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.integer "weight_values"
  #  t.integer "display_sequence", :default => 10
  #  t.string "default_flag", :limit => 1, :default => "N", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_urgencies, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_urgencies", ["code"], :name => "CHM_CHANGE_URGENCIES_N1"
  #
  #
  #create_table "chm_change_urgencies_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "change_urgency_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :chm_change_urgencies_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "chm_change_urgencies_tl", ["change_urgency_id", "language"], :name => "CHM_CHANGE_URGENCIES_TL_U1", :unique => true
  #add_index "chm_change_urgencies_tl", ["change_urgency_id"], :name => "CHM_CHANGE_URGENCIES_TL_N1"
  #
  #
  #create_table "com_config_attributes", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.string "config_class_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "input_type", :limit => 30
  #  t.string "input_value", :limit => 200
  #  t.string "regular", :limit => 100
  #  t.string "required_flag", :limit => 1, :default => "N", :null => true
  #  t.string "display_flag", :limit => 1, :default => "N", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_attributes, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "com_config_attributes", ["code"], :name => "COM_CONFIG_ATTRIBUTE_N1"
  #
  #
  #create_table "com_config_attributes_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_attribute_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_attributes_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "com_config_attributes_tl", ["config_attribute_id", "language"], :name => "COM_CONFIG_ATTRIBUTE_TL_U1", :unique => true
  #add_index "com_config_attributes_tl", ["config_attribute_id"], :name => "COM_CONFIG_ATTRIBUTE_TL_N1"
  #
  #
  #create_table "com_config_class_explosions", :force => true do |t|
  #  t.string "parent_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "direct_parent_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "config_class_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_class_explosions, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "com_config_class_explosions", ["parent_id", "direct_parent_id", "config_class_id"], :name => "COM_CLASS_CONFIG_EXPLOSIONS_U1", :unique => true
  #
  #
  #create_table "com_config_classes", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.string "leaf_flag", :limit => 1, :default => "N", :null => true
  #  t.string "parent_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_classes, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "com_config_classes", ["code"], :name => "COM_CONFIG_CLASS_N1"
  #
  #
  #create_table "com_config_classes_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_class_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_classes_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "com_config_classes_tl", ["config_class_id", "language"], :name => "COM_CONFIG_CLASS_TL_U1", :unique => true
  #add_index "com_config_classes_tl", ["config_class_id"], :name => "COM_CONFIG_CLASS_TL_N1"
  #
  #
  #create_table "com_config_item_attributes", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_item_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "config_attribute_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "value", :limit => 150
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_item_attributes, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "com_config_item_relations", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_item_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "config_relation_type_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "relation_config_item_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "description", :limit => 240
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_item_relations, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "com_config_item_statuses", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 30, :null => true
  #  t.integer "display_sequence"
  #  t.string "display_color", :limit => 7
  #  t.string "default_flag", :limit => 1, :default => "N"
  #  t.string "close_flag", :limit => 1, :default => "N", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_item_statuses, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "com_config_item_statuses", ["code"], :name => "COM_CONFIG_ITEM_STATUSES_N1"
  #
  #
  #create_table "com_config_item_statuses_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_item_status_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_item_statuses_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "com_config_item_statuses_tl", ["config_item_status_id", "language"], :name => "COM_CONFIG_ITEM_STATUSES_TL_U1", :unique => true
  #add_index "com_config_item_statuses_tl", ["config_item_status_id"], :name => "COM_CONFIG_ITEM_STATUSES_TL_N1"
  #
  #
  #create_table "com_config_items", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "item_number", :limit => 30, :null => true
  #  t.string "config_class_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "config_item_status_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "managed_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "managed_person_id", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "last_checked_at"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_items, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "com_config_relation_members", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_relation_type_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_class_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_relation_members, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "com_config_relation_types", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "code", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_relation_types, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "com_config_relation_types_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "config_relation_type_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :com_config_relation_types_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "csi_survey_members", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "survey_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "source_type"
  #  t.string "source_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "required_flag", :limit => 1
  #  t.string "response_flag", :limit => 1
  #  t.date "end_date_active"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :csi_survey_members, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "csi_survey_members", ["opu_id", "person_id", "response_flag"], :name => "CSI_SURVEY_MEMBERS_N4"
  #add_index "csi_survey_members", ["opu_id", "person_id"], :name => "CSI_SURVEY_MEMBERS_N2"
  #add_index "csi_survey_members", ["opu_id", "survey_id", "person_id"], :name => "CSI_SURVEY_MEMBERS_N3"
  #add_index "csi_survey_members", ["opu_id", "survey_id"], :name => "CSI_SURVEY_MEMBERS_N1"
  #
  #
  #create_table "csi_survey_ranges", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "survey_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "source_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "source_type", :limit => 30
  #  t.string "required_flag", :limit => 1
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :csi_survey_ranges, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "csi_survey_ranges", ["opu_id"], :name => "CSI_SURVEY_RANGES_N1"
  #
  #create_table "csi_survey_responses", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "survey_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "survey_member_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "ip_address", :limit => 30
  #  t.string "source_type", :limit => 30
  #  t.datetime "start_at"
  #  t.datetime "end_at"
  #  t.integer "elapse"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :csi_survey_responses, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "csi_survey_responses", ["survey_id"], :name => "CSI_SURVEY_RESPONSES_N1"
  #
  #
  #create_table "csi_survey_results", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "survey_response_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "survey_subject_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "result_type", :limit => 30
  #  t.string "survey_subject_option_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "text_input", :limit => 240
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :csi_survey_results, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "csi_survey_results", ["survey_response_id", "survey_subject_id"], :name => "CSI_SURVEY_RESULTS_N1"
  #
  #
  #create_table "csi_survey_subject_options", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "survey_subject_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "value", :limit => 240
  #  t.integer "display_sequence"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :csi_survey_subject_options, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "csi_survey_subject_options", ["survey_subject_id"], :name => "CSI_SURVEY_SUBJECT_OPTIONS_N1"
  #
  #
  #create_table "csi_survey_subjects", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "survey_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "required_flag", :limit => 1
  #  t.string "input_type", :limit => 30
  #  t.string "publish_result_flag", :limit => 1
  #  t.integer "display_sequence"
  #  t.string "other_input_flag"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :csi_survey_subjects, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "csi_survey_subjects", ["survey_id"], :name => "CSI_SURVEY_SUBJECTS_N1"
  #
  #
  #create_table "csi_surveys", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "title", :limit => 150, :null => true
  #  t.string "description", :limit => 240
  #  t.string "notify_flag", :limit => 1
  #  t.string "public_flag", :limit => 1
  #  t.string "security_filter_type", :limit => 30
  #  t.string "publish_result_flag", :limit => 1
  #  t.string "end_message", :limit => 240
  #  t.date "close_date"
  #  t.string "incident_flag", :limit => 1
  #  t.integer "time_limit", :limit => 1
  #  t.string "password_flag", :limit => 1
  #  t.string "password", :limit => 30
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :csi_surveys, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  create_table "delayed_jobs", :force => true do |t|
    t.integer "priority", :default => 0
    t.integer "attempts", :default => 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :delayed_jobs, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "delayed_jobs", ["priority", "run_at"], :name => "DELAYED_JOBS_N1"
  #
  #
  #create_table "icm_close_reasons", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "close_code", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_close_reasons, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_close_reasons", ["close_code"], :name => "ICM_CLOSE_REASONS_N1"
  #
  #
  #create_table "icm_close_reasons_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "close_reason_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_close_reasons_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_close_reasons_tl", ["close_reason_id", "language"], :name => "ICM_CLOSE_REASONS_TL_U1", :unique => true
  #add_index "icm_close_reasons_tl", ["close_reason_id"], :name => "ICM_CLOSE_REASONS_TL_N1"
  #
  #
  #create_table "icm_group_assignments", :force => true do |t|
  #  t.string "support_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "source_type", :limit => 30, :null => true
  #  t.string "source_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_group_assignments, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "icm_impact_ranges", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "impact_code", :limit => 60, :null => true
  #  t.integer "display_sequence", :default => 10
  #  t.string "default_flag", :limit => 1, :default => "N"
  #  t.integer "weight_values", :default => 1, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_impact_ranges, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_impact_ranges", ["impact_code"], :name => "ICM_IMPACT_RANGES_N1"
  #
  #
  #create_table "icm_impact_ranges_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "impact_range_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150, :null => true
  #  t.string "description", :limit => 240, :null => true
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_impact_ranges_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_impact_ranges_tl", ["impact_range_id", "language"], :name => "ICM_IMPACT_RANGES_TL_U1", :unique => true
  #add_index "icm_impact_ranges_tl", ["impact_range_id"], :name => "ICM_IMPACT_RANGES_TL_N1"
  #
  #
  #create_table "icm_incident_categories", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_categories, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_categories", ["code"], :name => "ICM_INCIDENT_CATEGORIES_U1"
  #
  #
  #create_table "icm_incident_categories_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_categories_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_categories_tl", ["incident_category_id", "language"], :name => "ICM_INCIDENT_CATEGORIES_TL_U1", :unique => true
  #add_index "icm_incident_categories_tl", ["incident_category_id"], :name => "ICM_INCIDENT_CATEGORIES_TL_N1"
  #
  #
  #create_table "icm_incident_category_systems", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "incident_category_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "external_system_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_category_systems, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_category_systems", ["incident_category_id", "external_system_id"], :name => "ICM_ICDT_CATEGORY_SYSTEMS_N1"
  #
  #
  #create_table "icm_incident_config_relations", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "incident_request_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "config_item_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_config_relations, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_config_relations", ["incident_request_id", "config_item_id"], :name => "ICM_ICDT_CONFIG_RELATIONS_U1", :unique => true
  #
  #
  #create_table "icm_incident_histories", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "request_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "journal_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "batch_number", :limit => 30
  #  t.string "property_key", :limit => 60
  #  t.string "old_value", :limit => 60
  #  t.string "new_value", :limit => 60
  #  t.integer "elapsed_time"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_histories, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_histories", ["journal_id"], :name => "ICM_INCIDENT_HISTORIES_N2"
  #add_index "icm_incident_histories", ["request_id"], :name => "ICM_INCIDENT_HISTORIES_N1"
  #
  #
  #create_table "icm_incident_journal_elapses", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "incident_journal_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "elapse_type", :limit => 30
  #  t.string "support_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_status_id", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "start_at"
  #  t.datetime "end_at"
  #  t.integer "distance"
  #  t.integer "real_distance"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_journal_elapses, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "icm_incident_journals", :force => true do |t|
  #  t.string "journal_number", :limit => 30
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_request_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "reply_type", :limit => 30
  #  t.string "replied_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.text "message_body", :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_journals, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_journals", ["incident_request_id"], :name => "ICM_INCIDENT_JOURNALS_N1"
  #add_index "icm_incident_journals", ["replied_by"], :name => "ICM_INCIDENT_JOURNALS_N2"
  #
  #
  #create_table "icm_incident_phases", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "phase_code", :limit => 30, :null => true
  #  t.integer "display_sequence"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_phases, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_phases", ["phase_code"], :name => "ICM_INCIDENT_PHASES_N1"
  #
  #
  #create_table "icm_incident_phases_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_phase_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_phases_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_phases_tl", ["incident_phase_id", "language"], :name => "ICM_INCIDENT_PHASES_TL_U1", :unique => true
  #add_index "icm_incident_phases_tl", ["incident_phase_id"], :name => "ICM_INCIDENT_PHASES_TL_N1"
  #
  #
  #create_table "icm_incident_request_relations", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "source_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "target_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "relation_type", :limit => 10, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_request_relations, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "icm_incident_requests", :force => true do |t|
  #  t.string "request_number", :limit => 30
  #  t.string "title", :limit => 150, :null => true
  #  t.text "summary", :null => true
  #  t.string "hotline", :limit => 1, :default => "N", :null => true
  #  t.string "client_info", :limit => 150
  #  t.string "external_system_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "service_code", :limit => 30
  #  t.string "incident_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_sub_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "requested_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "organization_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "submitted_by", :limit => 22, :collate => "utf8_bin"
  #  t.integer "weight_value", :null => true
  #  t.string "contact_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "contact_number"
  #  t.string "request_type_code", :limit => 30
  #  t.string "report_source_code", :limit => 30
  #  t.string "incident_status_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "priority_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "impact_range_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "urgence_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "close_reason_id", :limit => 22, :collate => "utf8_bin"
  #  t.float "real_processing_time", :default => 0.0
  #  t.string "support_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "support_person_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "upgrade_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "upgrade_person_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "charge_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "charge_person_id", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "submitted_date"
  #  t.integer "reply_count", :default => 0, :null => true
  #  t.string "kb_flag", :limit => 1, :default => "N", :null => true
  #  t.datetime "last_request_date"
  #  t.datetime "last_response_date"
  #  t.date "estimated_date"
  #  t.string "next_reply_user_license", :limit => 30
  #  t.string "change_request_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #  t.datetime "change_requested_at"
  #end
  #
  #change_column :icm_incident_requests, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_requests", ["incident_status_id", "next_reply_user_license", "last_request_date", "last_response_date"], :name => "ICM_INCIDENT_REQUESTS_N2"
  #add_index "icm_incident_requests", ["opu_id"], :name => "ICM_INCIDENT_REQUESTS_N1"
  #
  #
  #create_table "icm_incident_statuses", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "incident_status_code", :limit => 30, :null => true
  #  t.string "phase_code", :limit => 30
  #  t.integer "display_sequence"
  #  t.string "display_color", :limit => 7
  #  t.string "default_flag", :limit => 1, :default => "N"
  #  t.string "close_flag", :limit => 1, :default => "N", :null => true
  #  t.string "permanent_close_flag", :limit => 1, :default => "N"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_statuses, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_statuses", ["incident_status_code"], :name => "ICM_INCIDENT_STATUSES_N1"
  #
  #
  #create_table "icm_incident_statuses_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_status_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_statuses_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_statuses_tl", ["incident_status_id", "language"], :name => "ICM_INCIDENT_STATUSES_TL_U1", :unique => true
  #add_index "icm_incident_statuses_tl", ["incident_status_id"], :name => "ICM_INCIDENT_STATUSES_TL_N1"
  #
  #
  #create_table "icm_incident_sub_categories", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "code", :limit => 60, :null => true
  #  t.string "incident_category_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_sub_categories, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_sub_categories", ["code"], :name => "ICM_INCIDENT_SUB_CATEGORIES_U1"
  #
  #
  #create_table "icm_incident_sub_categories_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_sub_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_sub_categories_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_incident_sub_categories_tl", ["incident_sub_category_id", "language"], :name => "ICM_ICDT_SUB_CATEGORIES_TL_U1", :unique => true
  #add_index "icm_incident_sub_categories_tl", ["incident_sub_category_id"], :name => "ICM_ICDT_SUB_CATEGORIES_TL_N1"
  #
  #
  #create_table "icm_incident_workloads", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_request_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 22, :collate => "utf8_bin"
  #  t.float "real_processing_time"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_incident_workloads, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "icm_mail_requests", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "username", :limit => 60, :null => true
  #  t.string "password", :limit => 30, :null => true
  #  t.string "external_system_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "service_code", :limit => 30, :null => true
  #  t.string "incident_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "incident_sub_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "impact_range_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "urgency_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "support_group_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "support_person_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "request_type_code", :limit => 30
  #  t.string "report_source_code", :limit => 30
  #  t.string "incident_status_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_mail_requests, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "icm_priority_codes", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "priority_code", :limit => 60, :null => true
  #  t.integer "weight_values", :default => 1, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_priority_codes, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_priority_codes", ["priority_code"], :name => "ICM_PRIORITY_CODES_N1"
  #
  #
  #create_table "icm_priority_codes_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "priority_code_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_priority_codes_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_priority_codes_tl", ["priority_code_id", "language"], :name => "ICM_PRIORITY_CODES_TL_U1", :unique => true
  #add_index "icm_priority_codes_tl", ["priority_code_id"], :name => "ICM_PRIORITY_CODES_TL_N1"
  #
  #
  #create_table "icm_rule_settings", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "description", :limit => 150
  #  t.string "report_date_changable", :limit => 1, :default => "N"
  #  t.string "respond_date_changable", :limit => 1, :default => "N"
  #  t.string "slove_date_changable", :limit => 1, :default => "N"
  #  t.string "auto_assignable", :limit => 1, :default => "N"
  #  t.integer "auto_closure_days", :default => 5
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_rule_settings, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "icm_status_transforms", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "from_status_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "to_status_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "event_code", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_status_transforms, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_status_transforms", ["from_status_id", "to_status_id"], :name => "IRM_STATUS_TRANSFORMS", :unique => true
  #
  #
  #create_table "icm_support_groups", :force => true do |t|
  #  t.string "group_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "assignment_process_code", :limit => 30, :null => true
  #  t.string "vendor_flag", :limit => 1, :default => "N", :null => true
  #  t.string "oncall_flag", :limit => 1, :default => "N", :null => true
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_support_groups, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "icm_urgence_codes", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "urgency_code", :limit => 60, :null => true
  #  t.string "default_flag", :limit => 1, :default => "N"
  #  t.integer "display_sequence", :default => 10
  #  t.integer "weight_values", :default => 1, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_urgence_codes, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_urgence_codes", ["urgency_code"], :name => "ICM_URGENCE_CODES_N1"
  #
  #
  #create_table "icm_urgence_codes_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "urgence_code_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "language", :limit => 30, :null => true
  #  t.string "name", :limit => 150, :null => true
  #  t.string "description", :limit => 240, :null => true
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :icm_urgence_codes_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "icm_urgence_codes_tl", ["urgence_code_id", "language"], :name => "ICM_URGENCE_CODES_TL_U1", :unique => true
  #add_index "icm_urgence_codes_tl", ["urgence_code_id"], :name => "ICM_URGENCE_CODES_TL_N1"


  create_table "irm_application_tabs", :force => true do |t|
    t.string "application_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "tab_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "default_flag", :limit => 1, :default => "N", :null => true
    t.integer "seq_num", :null => true
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_application_tabs, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_application_tabs", ["application_id", "tab_id"], :name => "IRM_APPLICATION_TABS_U1", :unique => true


  create_table "irm_applications", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "image_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_applications, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_applications_tl", :force => true do |t|
    t.string "application_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_applications_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_applications_tl", ["application_id", "language"], :name => "IRM_APPLICATIONS_TL_U1", :unique => true


  create_table "irm_attachment_versions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "attachment_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "description", :limit => 240
    t.string "private_flag", :limit => 1
    t.string "image_flag", :limit => 1, :default => "Y"
    t.string "category_id", :limit => 22, :collate => "utf8_bin"
    t.string "source_type", :limit => 30
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.string "source_file_name", :limit => 150
    t.string "data_file_name", :limit => 150
    t.string "data_content_type", :limit => 150
    t.integer "data_file_size"
    t.datetime "data_updated_at"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_attachment_versions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_attachment_versions", ["source_id", "source_type"], :name => "IRM_ATTACHMENT_VERSIONS_N1"


  create_table "irm_attachments", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "description", :limit => 240
    t.string "private_flag", :limit => 1
    t.string "latest_version_id", :limit => 22, :collate => "utf8_bin"
    t.string "file_name", :limit => 150
    t.string "file_category", :limit => 22
    t.integer "file_size"
    t.string "file_type", :limit => 30
    t.string "source_file_name", :limit => 150
    t.string "status_code", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_attachments, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_bu_columns", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "parent_column_id", :limit => 22, :collate => "utf8_bin"
    t.string "bu_column_code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_bu_columns, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_bu_columns", ["bu_column_code", "opu_id"], :name => "IRM_BU_COLUMNS_U1", :unique => true


  create_table "irm_bu_columns_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bu_column_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "language", :limit => 30, :null => true
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_bu_columns_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_bu_columns_tl", ["bu_column_id", "language"], :name => "IRM_BU_COLUMNS_TL_U1", :unique => true
  add_index "irm_bu_columns_tl", ["bu_column_id"], :name => "IRM_BU_COLUMNS_TL_N1"


  create_table "irm_bulletin_accesses", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bulletin_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "access_type", :null => true
    t.string "access_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_bulletin_accesses, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_bulletin_columns", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bulletin_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bu_column_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_bulletin_columns, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_bulletins", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "title", :limit => 150, :null => true
    t.string "summary", :limit => 240
    t.string "content", :limit => 3000
    t.string "author_id", :limit => 22, :collate => "utf8_bin"
    t.string "important_code", :limit => 30
    t.string "sticky_flag", :limit => 30, :default => "N"
    t.string "highlight_flag", :limit => 30, :default => "N"
    t.integer "page_views"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_bulletins, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_business_objects", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "business_object_code", :limit => 30, :null => true
    t.string "bo_table_name", :limit => 60, :null => true
    t.string "bo_model_name", :limit => 150
    t.string "auto_generate_flag", :limit => 1, :default => "Y", :null => true
    t.string "multilingual_flag", :limit => 1, :default => "N", :null => true
    t.string "standard_flag", :limit => 1, :default => "Y"
    t.string "report_flag", :limit => 1, :default => "N"
    t.string "workflow_flag", :limit => 1, :default => "N"
    t.string "data_access_flag", :limit => 1, :default => "N"
    t.text "sql_cache"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_business_objects, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_business_objects", ["business_object_code"], :name => "IRM_BUSINESS_OBJECTS_N1"


  create_table "irm_business_objects_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 60, :null => true
    t.string "description", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_business_objects_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_business_objects_tl", ["business_object_id", "language"], :name => "IRM_BUSINESS_OBJECTS_TL_U1", :unique => true


  create_table "irm_calendars", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.integer "assigned_to"
    t.string "current", :limit => 1
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 3000
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_calendars, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_cards", :force => true do |t|
    t.string "card_code", :limit => 30, :null => true
    t.string "background_color", :limit => 30
    t.string "font_color", :limit => 30
    t.string "bo_code", :limit => 30
    t.string "rule_filter_id", :limit => 22, :collate => "utf8_bin"
    t.string "system_flag", :limit => 1, :default => "N", :null => true
    t.text "card_url"
    t.string "title_attribute_name", :limit => 30
    t.string "description_attribute_name", :limit => 30
    t.string "date_attribute_name", :limit => 30
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_cards, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_cards", ["card_code", "opu_id"], :name => "IRM_CARD_TYPE_U1", :unique => true


  create_table "irm_cards_tl", :force => true do |t|
    t.string "card_id", :limit => 22, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_cards_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_cards_tl", ["card_id", "language"], :name => "IRM_CARDS_TL_U1", :unique => true


  create_table "irm_currencies", :force => true do |t|
    t.string "currency_code", :limit => 30, :null => true
    t.integer "precision"
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_currencies, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_currencies", ["currency_code"], :name => "IRM_CURRENCIES_U1"


  create_table "irm_currencies_tl", :force => true do |t|
    t.string "currency_id", :limit => 22, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_currencies_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_currencies_tl", ["currency_id", "language"], :name => "IRM_CURRENCIES_TL_U1"


  create_table "irm_data_accesses", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :collate => "utf8_bin"
    t.string "access_level", :limit => 30, :null => true
    t.string "hierarchy_access_flag", :limit => 1, :default => "N"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_data_accesses, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_data_accesses", ["opu_id", "organization_id", "business_object_id"], :name => "IRM_DATA_ACCESSES_U1", :unique => true


  create_table "irm_data_accesses_t", :id => false, :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bo_model_name", :limit => 150, :null => true
    t.string "source_person_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "target_person_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "access_level", :limit => 60
    t.datetime "created_at"
  end

  add_index "irm_data_accesses_t", ["business_object_id", "source_person_id", "target_person_id"], :name => "IRM_DATA_ACCESSES_T_U1", :unique => true


  create_table "irm_data_accesses_top_org_t", :id => false, :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :collate => "utf8_bin"
    t.string "access_type", :limit => 13, :default => "", :null => true
    t.string "source_type", :limit => 30, :default => "", :null => true
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.string "target_type", :limit => 30, :default => "", :null => true
    t.string "target_id", :limit => 22, :collate => "utf8_bin"
    t.string "access_level", :limit => 30
  end

  add_index "irm_data_accesses_top_org_t", ["source_type", "source_id"], :name => "source_type"
  add_index "irm_data_accesses_top_org_t", ["target_type", "target_id"], :name => "target_type"


  create_table "irm_data_share_rules", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "business_object_id", :limit => 22, :collate => "utf8_bin"
    t.string "rule_type", :limit => 30, :null => true
    t.string "source_type", :limit => 30, :null => true
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.string "target_type", :limit => 30, :null => true
    t.string "target_id", :limit => 22, :collate => "utf8_bin"
    t.string "access_level", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_data_share_rules, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_data_share_rules", ["business_object_id"], :name => "IRM_DATA_SHARE_RULES_N1"
  add_index "irm_data_share_rules", ["source_id"], :name => "IRM_DATA_SHARE_RULES_N2"
  add_index "irm_data_share_rules", ["target_id"], :name => "IRM_DATA_SHARE_RULES_N3"


  create_table "irm_data_share_rules_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "data_share_rule_id", :limit => 30, :null => true
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_data_share_rules_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_data_share_rules_tl", ["data_share_rule_id", "language"], :name => "IRM_DATA_SHARE_RULES_U1", :unique => true
  add_index "irm_data_share_rules_tl", ["data_share_rule_id"], :name => "IRM_DATA_SHARE_RULES_N13"


  create_table "irm_delayed_job_log_items", :force => true do |t|
    t.string "delayed_job_id", :limit => 22, :collate => "utf8_bin"
    t.text "content"
    t.string "job_status", :limit => 30
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_delayed_job_log_items, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_delayed_job_logs", :force => true do |t|
    t.string "delayed_job_id", :limit => 22, :collate => "utf8_bin"
    t.string "instance_id", :limit => 22, :collate => "utf8_bin"
    t.string "bo_code", :limit => 30
    t.integer "priority"
    t.integer "attempts"
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "end_at"
    t.datetime "failed_at"
    t.datetime "locked_at"
    t.string "locked_by", :limit => 22, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_delayed_job_logs, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_delayed_jobs_record_items", :force => true do |t|
    t.text "error_info"
    t.integer "attempt"
    t.datetime "record_at"
    t.string "pid", :limit => 22
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_delayed_jobs_record_items, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_delayed_jobs_records", :force => true do |t|
    t.integer "priority", :default => 0
    t.text "handler"
    t.string "run_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "run_at"
    t.datetime "end_at"
    t.integer "status"
    t.string "delayed_job_id", :limit => 22, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_delayed_jobs_records, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_events", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "event_code", :limit => 30, :null => true
    t.string "bo_code", :limit => 30
    t.string "business_object_id", :limit => 22, :collate => "utf8_bin"
    t.string "event_type", :limit => 30
    t.text "params"
    t.datetime "end_at"
    t.string "last_error"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_events, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_events", ["event_code"], :name => "IRM_EVENTS_N1"


  create_table "irm_external_system_people", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "external_system_id", :limit => 22, :collate => "utf8_bin"
    t.string "person_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_external_system_people, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_external_systems", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "hotline_flag", :limit => 1, :default => "Y"
    t.string "external_system_code", :limit => 30
    t.string "external_hostname", :limit => 150
    t.string "external_ip_address", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_external_systems, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_external_systems", ["opu_id", "external_system_code"], :name => "IRM_EXTERNAL_SYSTEMS_N1"


  create_table "irm_external_systems_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "external_system_id", :limit => 22, :collate => "utf8_bin"
    t.string "system_name", :limit => 30
    t.string "system_description", :limit => 150, :null => true
    t.string "language", :limit => 30, :null => true
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_external_systems_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_external_systems_tl", ["external_system_id", "language"], :name => "IRM_EXTERNAL_SYSTEMS_TL_N1"


  create_table "irm_flex_value_sets", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "flex_value_set_name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "validation_type", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_flex_value_sets, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_flex_values", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "flex_value_set_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "flex_value", :limit => 30, :null => true
    t.integer "display_sequence", :default => 10
    t.datetime "start_date_active"
    t.datetime "end_date_active"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_flex_values, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_flex_values", ["flex_value", "opu_id"], :name => "IRM_FLEX_VALUES_U1", :unique => true


  create_table "irm_flex_values_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "flex_value_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "flex_value_meaning", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "language", :limit => 30, :null => true
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_flex_values_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_flex_values_tl", ["flex_value_id", "language"], :name => "IRM_FLEX_VALUES_TL_U1", :unique => true


  create_table "irm_formula_functions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "function_code", :limit => 30, :null => true
    t.string "parameters", :limit => 150
    t.string "function_type", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_formula_functions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_formula_functions", ["function_code", "opu_id"], :name => "IRM_FORMULA_FUNCTIONS_U1", :unique => true


  create_table "irm_formula_functions_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "formula_function_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "description", :limit => 150
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_formula_functions_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_formula_functions_tl", ["formula_function_id", "language"], :name => "IRM_FORMULA_FUNCTIONS_TL_U1", :unique => true


  create_table "irm_function_groups", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "zone_code", :limit => 30, :null => true
    t.string "code", :limit => 30, :null => true
    t.string "controller", :limit => 60, :null => true
    t.string "action", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_function_groups, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_function_groups", ["code", "opu_id"], :name => "IRM_FUNCTION_GROUPS_U1", :unique => true


  create_table "irm_function_groups_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "function_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_function_groups_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_function_groups_tl", ["function_group_id", "language"], :name => "IRM_FUNCTION_GROUPS_TL_U1", :unique => true


  create_table "irm_functions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "function_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "login_flag", :limit => 1, :default => "N", :null => true
    t.string "public_flag", :limit => 1, :default => "N", :null => true
    t.string "default_flag", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_functions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_functions", ["code", "opu_id"], :name => "IRM_FUNCTIONS_U1", :unique => true


  create_table "irm_functions_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "function_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_functions_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_functions_tl", ["function_id", "language"], :name => "IRM_FUNCTIONS_TL_U1", :unique => true


  create_table "irm_general_categories", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "category_type", :limit => 30
    t.string "segment1", :limit => 30
    t.string "segment2", :limit => 30
    t.string "segment3", :limit => 30
    t.string "concact_segment", :limit => 90
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_general_categories, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_group_explosions", :force => true do |t|
    t.string "parent_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "direct_parent_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_group_explosions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_group_explosions", ["parent_group_id", "direct_parent_group_id", "group_id"], :name => "IRM_GROUP_EXPLOSIONS_U1", :unique => true


  create_table "irm_group_members", :force => true do |t|
    t.string "group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "person_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_group_members, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_group_members", ["group_id", "person_id"], :name => "IRM_GROUP_MEMBERS_U1", :unique => true


  create_table "irm_groups", :force => true do |t|
    t.string "parent_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_groups, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_groups_tl", :force => true do |t|
    t.string "group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_groups_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_groups_tl", ["group_id", "language"], :name => "IRM_GROUPS_TL_U1", :unique => true


  create_table "irm_id_flex_segments", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "id_flex_code", :limit => 30, :null => true
    t.integer "id_flex_num", :null => true
    t.integer "segment_num", :null => true
    t.string "segment_name", :limit => 150, :null => true
    t.string "display_flag", :limit => 1, :default => "Y"
    t.integer "display_size"
    t.string "default_type", :limit => 30
    t.string "default_value", :limit => 240
    t.string "flex_value_set_name", :limit => 30
    t.string "status_code", :limit => 30
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_id_flex_segments, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_id_flex_segments", ["segment_name", "opu_id"], :name => "IRM_ID_FLEX_SEGMENTS_U1", :unique => true


  create_table "irm_id_flex_segments_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "segment_name", :limit => 150, :null => true
    t.string "form_left_prompt", :limit => 150
    t.string "form_above_prompt", :limit => 150
    t.string "description", :limit => 240
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_id_flex_segments_tl, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_id_flex_structures", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "id_flex_code", :limit => 30, :null => true
    t.integer "id_flex_num", :null => true
    t.string "id_flex_structure_code", :limit => 30, :null => true
    t.string "concatenated_segment_delimiter"
    t.string "freeze_flex_definition_flag"
    t.string "status_code", :limit => 30
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_id_flex_structures, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_id_flex_structures", ["id_flex_structure_code", "opu_id"], :name => "IRM_ID_FLEX_STRUCTURES_U1", :unique => true


  create_table "irm_id_flex_structures_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "id_flex_structure_id", :limit => 22, :collate => "utf8_bin"
    t.string "id_flex_structure_name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_id_flex_structures_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_id_flex_structures_tl", ["language", "id_flex_structure_id"], :name => "IRM_ID_FLEX_STRUCTURES_TL_U1", :unique => true


  create_table "irm_id_flexes", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "id_flex_code", :limit => 30, :null => true
    t.string "id_flex_name", :limit => 150
    t.string "description", :limit => 240
    t.string "status_code", :limit => 30
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_id_flexes, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_id_flexes", ["id_flex_code", "opu_id"], :name => "IRM_ID_FLEXES_U1", :unique => true


  create_table "irm_imap_settings", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "protocol", :limit => 150
    t.string "host_name", :limit => 60
    t.string "port", :limit => 30
    t.string "timeout", :limit => 30, :default => "10000"
    t.string "username", :limit => 60
    t.string "password", :limit => 60
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_imap_settings, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_kanban_lanes", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "kanban_id", :limit => 22, :collate => "utf8_bin"
    t.string "lane_id", :limit => 22, :collate => "utf8_bin"
    t.integer "display_sequence", :default => 1, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_kanban_lanes, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_kanban_ranges", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "kanban_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "range_type", :limit => 30, :null => true
    t.string "range_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_kanban_ranges, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_kanbans", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.integer "limit", :default => 5
    t.integer "refresh_interval", :default => 5
    t.string "kanban_code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "position_code", :limit => 30
  end

  change_column :irm_kanbans, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_kanbans", ["kanban_code", "opu_id"], :name => "IRM_KANBAN_TYPE_U1", :unique => true


  create_table "irm_kanbans_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "kanban_id", :limit => 22, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_kanbans_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_kanbans_tl", ["kanban_id", "language"], :name => "IRM_KANBANS_TL_U1", :unique => true


  create_table "irm_lane_cards", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "lane_id", :limit => 22, :collate => "utf8_bin"
    t.string "card_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_lane_cards, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_lanes", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "lane_code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_lanes, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_lanes", ["lane_code", "opu_id"], :name => "IRM_LANE_TYPE_U1", :unique => true


  create_table "irm_lanes_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "lane_id", :limit => 22, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_lanes_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_lanes_tl", ["lane_id", "language"], :name => "IRM_LANES_TL_U1", :unique => true


  create_table "irm_languages", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "language_code", :limit => 30, :null => true
    t.string "installed_flag", :limit => 1, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_languages, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_languages", ["language_code"], :name => "IRM_LANGUAGES_U1", :unique => true


  create_table "irm_languages_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "language_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "description", :limit => 150, :null => true
    t.string "language", :limit => 30, :null => true
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_languages_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_languages_tl", ["language_id", "language"], :name => "IRM_LANGUAGES_TL_N1", :unique => true


  create_table "irm_ldap_auth_attributes", :force => true do |t|
    t.string "ldap_auth_header_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "local_attr", :limit => 60, :null => true
    t.string "attr_type", :limit => 60
    t.string "ldap_attr", :limit => 60, :null => true
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "description", :limit => 150
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_ldap_auth_attributes, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ldap_auth_headers", :force => true do |t|
    t.string "ldap_source_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 60, :null => true
    t.string "auth_cn", :null => true
    t.string "ldap_login_name_attr", :limit => 30, :null => true
    t.string "ldap_email_address_attr", :limit => 30
    t.string "template_person_id", :limit => 22, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "description", :limit => 150
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_ldap_auth_headers, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ldap_sources", :force => true do |t|
    t.string "type", :limit => 30
    t.string "name", :limit => 150, :null => true
    t.string "host", :limit => 150, :null => true
    t.integer "port", :null => true
    t.string "account", :limit => 60, :null => true
    t.string "account_password", :limit => 60, :null => true
    t.string "base_dn"
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "description", :limit => 150
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_ldap_sources, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ldap_syn_attributes", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "ldap_syn_header_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "local_attr", :limit => 60, :null => true
    t.string "local_attr_type", :limit => 30
    t.string "ldap_attr", :limit => 60, :null => true
    t.string "ldap_attr_type", :limit => 30
    t.string "object_type", :limit => 30, :null => true
    t.string "null_able", :limit => 10, :null => true
    t.string "language_code", :limit => 10
    t.string "description", :limit => 150
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_ldap_syn_attributes, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ldap_syn_headers", :force => true do |t|
    t.string "name", :limit => 60, :null => true
    t.string "ldap_source_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "base_dn", :limit => 150
    t.string "comp_filter", :limit => 150
    t.string "comp_object", :limit => 30, :null => true
    t.integer "comp_level", :default => 1
    t.string "comp_desc", :limit => 150
    t.string "comp_syn_flag", :limit => 1, :default => "Y"
    t.string "org_filter", :limit => 150
    t.string "org_object", :limit => 30, :null => true
    t.string "org_syn_flag", :limit => 1, :default => "Y"
    t.integer "org_level", :default => 2
    t.string "org_desc", :limit => 150
    t.string "dept_filter", :limit => 150
    t.string "dept_object", :limit => 30, :null => true
    t.string "dept_syn_flag", :limit => 1, :default => "Y"
    t.integer "dept_level", :default => 3
    t.string "dept_desc", :limit => 150
    t.string "peo_syn_flag", :limit => 1, :default => "N"
    t.integer "peo_level", :default => 4
    t.string "ldap_auth_header_id", :limit => 22, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "syn_status", :limit => 20
  end

  change_column :irm_ldap_syn_headers, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ldap_syn_interface", :force => true do |t|
    t.string "process_id", :limit => 22, :collate => "utf8_bin"
    t.string "comp_short_name", :limit => 30
    t.string "comp_company_type", :limit => 30
    t.string "comp_time_zone", :limit => 30
    t.string "comp_currency_code", :limit => 30
    t.string "comp_cost_center_code", :limit => 30
    t.string "comp_budget_code", :limit => 30
    t.string "comp_hotline", :limit => 30
    t.string "comp_home_page", :limit => 60
    t.integer "comp_support_manager"
    t.string "comp_type", :limit => 60
    t.string "comp_name", :limit => 150
    t.string "comp_description", :limit => 240
    t.string "comp_status_code", :limit => 30
    t.string "comp_dn", :limit => 150
    t.string "org_short_name", :limit => 30
    t.string "org_status_code", :limit => 30
    t.string "org_name", :limit => 150
    t.string "org_description", :limit => 240
    t.string "org_dn", :limit => 150
    t.string "dept_short_name", :limit => 30
    t.string "dept_status_code", :limit => 30
    t.string "dept_name", :limit => 150
    t.string "dept_description", :limit => 240
    t.string "dept_dn", :limit => 150
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "process_status", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "department_id", :limit => 22, :collate => "utf8_bin"
  end

  change_column :irm_ldap_syn_interface, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ldap_syn_peo_interface", :force => true do |t|
    t.string "process_id", :limit => 22, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "department_id", :limit => 22, :collate => "utf8_bin"
    t.string "title", :limit => 30
    t.string "first_name", :limit => 30
    t.string "last_name", :limit => 30
    t.string "job_title", :limit => 30
    t.string "vip_flag", :limit => 1, :default => "N"
    t.string "support_staff_flag", :limit => 1, :default => "N"
    t.string "assignment_availability_flag", :limit => 1, :default => "N"
    t.string "email_address", :limit => 150
    t.string "home_phone", :limit => 30
    t.string "home_address", :limit => 30
    t.string "mobile_phone", :limit => 30
    t.string "fax_number", :limit => 30
    t.string "bussiness_phone", :limit => 30
    t.string "region_code", :limit => 30
    t.string "site_group_code", :limit => 30
    t.string "site_code", :limit => 30
    t.string "function_group_code", :limit => 30
    t.string "avatar_path", :limit => 150
    t.string "avatar_file_name", :limit => 30
    t.string "avatar_content_type", :limit => 30
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "identity_id", :limit => 22, :collate => "utf8_bin"
    t.string "approve_request_mail", :limit => 30
    t.string "manager", :limit => 30
    t.string "delegate_approver", :limit => 30
    t.string "last_login_at", :limit => 30
    t.string "type", :limit => 30
    t.string "language_code", :limit => 30
    t.string "auth_source_id", :limit => 22, :collate => "utf8_bin"
    t.string "hashed_password", :limit => 60
    t.string "login_name", :limit => 30
    t.string "unrestricted_access_flag", :limit => 30
    t.string "notification_lang", :limit => 30
    t.string "notification_flag", :limit => 30
    t.string "capacity_rating", :limit => 30
    t.integer "open_tickets"
    t.string "task_capacity_rating", :limit => 30
    t.integer "open_tasks"
    t.datetime "last_assigned_date"
    t.string "ldap_dn", :limit => 200
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_ldap_syn_peo_interface, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ldap_syn_people", :force => true do |t|
    t.string "ldap_name", :limit => 100
    t.string "ldap_dn", :limit => 150
    t.string "auth_source_id", :limit => 22, :collate => "utf8_bin"
    t.string "filter", :limit => 200
    t.string "description", :limit => 155
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "department_id", :limit => 22, :collate => "utf8_bin"
    t.string "vip_flag", :limit => 1, :default => "N"
    t.string "unrestricted_access_flag", :limit => 30
    t.string "assignment_availability_flag", :limit => 1, :default => "N"
    t.string "region_code", :limit => 30
    t.string "site_group_code", :limit => 30
    t.string "site_code", :limit => 30
    t.string "function_group_code", :limit => 30
    t.string "notification_lang", :limit => 30
    t.string "notification_flag", :limit => 30
    t.string "role_id", :limit => 22, :collate => "utf8_bin"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_ldap_syn_people, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_license_functions", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "license_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "function_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_license_functions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_license_functions", ["license_id", "function_id"], :name => "IRM_LICENSE_FUNCTIONS_U1", :unique => true


  create_table "irm_licenses", :force => true do |t|
    t.string "code", :limit => 30
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_licenses, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_licenses_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "license_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_licenses_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_licenses_tl", ["license_id", "language"], :name => "IRM_LICENSES_TL_U1", :unique => true


  create_table "irm_list_of_values", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "lov_code", :limit => 30, :null => true
    t.string "bo_code", :limit => 30, :null => true
    t.text "where_clause"
    t.text "query_clause"
    t.text "addition_clause"
    t.string "id_column", :limit => 30, :null => true
    t.string "value_column", :limit => 30, :null => true
    t.string "value_column_width", :limit => 30
    t.string "desc_column", :limit => 30
    t.string "desc_column_width", :limit => 30
    t.string "addition_column", :limit => 150
    t.string "addition_column_width", :limit => 150
    t.string "listable_flag", :limit => 1, :default => "Y", :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_list_of_values, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_list_of_values", ["lov_code"], :name => "IRM_LIST_OF_VALUES_N1"


  create_table "irm_list_of_values_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "list_of_value_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 60, :null => true
    t.string "description", :limit => 150
    t.string "value_title", :limit => 60
    t.string "desc_title", :limit => 60
    t.string "addition_title", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_list_of_values_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_list_of_values_tl", ["list_of_value_id", "language"], :name => "IRM_LIST_OF_VALUES_TL_U1", :unique => true


  create_table "irm_locations", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "department_id", :limit => 22, :collate => "utf8_bin"
    t.string "site_group_code", :limit => 30
    t.string "site_code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_locations, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_locations", ["opu_id", "site_code"], :name => "IRM_LOCATIONS_U1", :unique => true


  create_table "irm_login_records", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "identity_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "session_id", :limit => 60, :null => true
    t.string "user_ip", :limit => 60
    t.string "user_agent", :limit => 1000
    t.string "browser", :limit => 30
    t.string "operate_system", :limit => 30
    t.datetime "login_at"
    t.string "login_status", :limit => 30, :default => "SUCCESS"
    t.datetime "logout_at"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_login_records, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_lookup_types", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "product_id", :limit => 22, :collate => "utf8_bin"
    t.string "lookup_level", :limit => 30, :null => true
    t.string "lookup_type", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_lookup_types, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_lookup_types", ["lookup_type"], :name => "IRM_LOOKUP_TYPES_N1"


  create_table "irm_lookup_types_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "product_id", :limit => 22, :collate => "utf8_bin"
    t.string "lookup_type_id", :limit => 22, :collate => "utf8_bin"
    t.string "meaning", :limit => 60, :null => true
    t.string "description", :limit => 150, :null => true
    t.string "language", :limit => 30, :null => true
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_lookup_types_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_lookup_types_tl", ["lookup_type_id", "language"], :name => "IRM_LOOKUP_TYPES_TL_N1"


  create_table "irm_lookup_values", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "lookup_type", :limit => 30, :null => true
    t.string "lookup_code", :limit => 30, :null => true
    t.date "start_date_active"
    t.date "end_date_active"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_lookup_values, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_lookup_values", ["lookup_type", "lookup_code"], :name => "IRM_LOOKUP_VALUES_N1"


  create_table "irm_lookup_values_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "lookup_value_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "source_lang", :limit => 30, :null => true
    t.string "meaning", :limit => 60, :null => true
    t.string "description", :limit => 150, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.date "created_at"
    t.date "updated_at"
  end

  change_column :irm_lookup_values_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_lookup_values_tl", ["lookup_value_id", "language"], :name => "IRM_LOOKUP_VALUES_TL_N1"


  create_table "irm_machine_codes", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "machine_addr", :limit => 17, :null => true
    t.string "machine_code", :limit => 4
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "irm_machine_codes", ["machine_addr"], :name => "IRM_MACHINE_CODES_U1", :unique => true
  add_index "irm_machine_codes", ["machine_code"], :name => "IRM_MACHINE_CODES_U2", :unique => true


  create_table "irm_mail_templates", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "template_code", :limit => 30, :null => true
    t.string "template_type", :limit => 30
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_mail_templates, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_mail_templates", ["template_code"], :name => "IRM_MAIL_TEMPLATES_N1"


  create_table "irm_mail_templates_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "template_id", :limit => 22, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "subject", :limit => 150, :null => true
    t.text "mail_body", :null => true
    t.text "parsed_template"
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_mail_templates_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_mail_templates_tl", ["template_id", "language"], :name => "IRM_MAIL_TEMPLATES_TL_N1"


  create_table "irm_menu_entries", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "menu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "sub_menu_id", :limit => 22, :collate => "utf8_bin"
    t.string "sub_function_group_id", :limit => 22, :collate => "utf8_bin"
    t.integer "display_sequence"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_menu_entries, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_menu_entries", ["menu_id"], :name => "IRM_MENU_ENTRIES_N1"


  create_table "irm_menu_entries_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "menu_entry_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_menu_entries_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_menu_entries_tl", ["menu_entry_id", "language"], :name => "IRM_MENU_ENTRIES_TL_U1", :unique => true


  create_table "irm_menus", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_menus, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_menus", ["code"], :name => "IRM_MENUS_U1", :unique => true


  create_table "irm_menus_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "menu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_menus_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_menus_tl", ["menu_id", "language"], :name => "IRM_MENUS_TL_U1", :unique => true


  create_table "irm_oauth_access_clients", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "name", :limit => 60, :null => true
    t.string "description", :limit => 150
    t.string "site_image_url", :limit => 150
    t.string "site_url", :limit => 150
    t.string "callback_url", :limit => 240
    t.string "token", :limit => 150
    t.string "secret", :limit => 60
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_oauth_access_clients, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_oauth_accesses", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "token_id", :limit => 22, :collate => "utf8_bin"
    t.string "ip_address", :limit => 30
    t.integer "times"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_oauth_accesses, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_oauth_codes", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "oauth_access_client_id", :limit => 22, :collate => "utf8_bin"
    t.string "person_id", :limit => 22, :collate => "utf8_bin"
    t.string "code", :limit => 150
    t.datetime "expire_at"
    t.string "access_scope", :limit => 60
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_oauth_codes, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_oauth_tokens", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "client_id", :limit => 22, :collate => "utf8_bin"
    t.string "user_id", :limit => 22, :collate => "utf8_bin"
    t.string "oauth_code_id", :limit => 22, :collate => "utf8_bin"
    t.string "token", :limit => 150
    t.string "refresh_token", :limit => 150
    t.datetime "expire_at"
    t.string "relation_oauth_token_id", :limit => 22, :collate => "utf8_bin"
    t.string "access_scope", :limit => 60
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_oauth_tokens, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_object_attributes", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :collate => "utf8_bin"
    t.string "attribute_name", :limit => 30, :null => true
    t.string "attribute_type", :limit => 30, :default => "TABLE_COLUMN", :null => true
    t.string "field_type", :limit => 30, :default => "CUSTOMED_FIELD"
    t.string "category", :limit => 30
    t.string "relation_exists_flag", :limit => 1, :default => "N"
    t.string "relation_bo_code", :limit => 30
    t.string "relation_bo_id", :limit => 22, :collate => "utf8_bin"
    t.string "relation_table_alias", :limit => 30
    t.string "relation_column", :limit => 30
    t.string "relation_object_attribute_id", :limit => 22, :collate => "utf8_bin"
    t.string "relation_type", :limit => 30
    t.text "relation_where_clause"
    t.string "relation_alias_ref_id", :limit => 22, :collate => "utf8_bin"
    t.string "lov_code", :limit => 30
    t.string "pick_list_code", :limit => 30
    t.string "data_type", :limit => 30
    t.string "data_length", :limit => 30
    t.string "data_null_flag", :limit => 30
    t.string "data_key_type", :limit => 30
    t.string "data_default_value", :limit => 30
    t.string "data_extra_info", :limit => 30
    t.string "label_flag", :limit => 1, :default => "N"
    t.string "required_flag", :limit => 1, :default => "N"
    t.string "update_flag", :limit => 1, :default => "N"
    t.string "person_flag", :limit => 1, :default => "N"
    t.string "filter_flag", :limit => 1, :default => "N"
    t.string "approve_flag", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_object_attributes, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_object_attributes_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "object_attribute_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 60, :null => true
    t.string "description", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_object_attributes_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_object_attributes_tl", ["object_attribute_id", "language"], :name => "IRM_OBJECT_ATTRIBUTES_TL_U1", :unique => true


  create_table "irm_object_codes", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "object_table_name", :null => true
    t.string "object_code", :limit => 4
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "irm_object_codes", ["object_code"], :name => "IRM_OBJECT_CODES_U2", :unique => true
  add_index "irm_object_codes", ["object_table_name"], :name => "IRM_OBJECT_CODES_U1", :unique => true


  create_table "irm_operation_units", :force => true do |t|
    t.string "short_name", :limit => 30
    t.string "primary_person_id", :limit => 22, :collate => "utf8_bin"
    t.string "license_id", :limit => 22, :collate => "utf8_bin"
    t.string "default_language_code", :limit => 22
    t.string "default_time_zone_code", :limit => 30
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_operation_units, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_operation_units_tl", :force => true do |t|
    t.string "operation_unit_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_operation_units_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_operation_units_tl", ["operation_unit_id", "language"], :name => "IRM_OPERATION_UNIT_TL_U1", :unique => true


  create_table "irm_organization_explosions", :force => true do |t|
    t.string "parent_org_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "direct_parent_org_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_organization_explosions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_organization_explosions", ["parent_org_id", "direct_parent_org_id", "organization_id"], :name => "IRM_ORGANIZATION_EXPLOSIONS_U1", :unique => true


  create_table "irm_organization_infos", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "name", :limit => 60, :null => true
    t.string "value", :limit => 50, :null => true
    t.string "description", :limit => 40, :null => true
    t.string "attachment_id", :limit => 22, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_organization_infos, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_organization_infos", ["name"], :name => "IRM_ORG_INFOS_N1"
  add_index "irm_organization_infos", ["organization_id"], :name => "IRM_ORG_INFOS_N2"
  add_index "irm_organization_infos", ["value"], :name => "IRM_ORG_INFOS_N3"


  create_table "irm_organizations", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "parent_org_id", :limit => 22, :collate => "utf8_bin"
    t.string "short_name", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "ldap_dn", :limit => 200
    t.string "hotline", :limit => 1, :default => "N", :null => true
  end

  change_column :irm_organizations, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_organizations", ["opu_id", "short_name"], :name => "IRM_ORGANIZATIONS_U1"


  create_table "irm_organizations_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_organizations_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_organizations_tl", ["organization_id", "language"], :name => "IRM_ORGANIZATIONS_TL_U1"


  create_table "irm_password_policies", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "expire_in", :limit => 30
    t.string "enforce_history", :limit => 30
    t.string "minimum_length", :limit => 30
    t.string "complexity_requirement", :limit => 30
    t.string "question_requirement", :limit => 30
    t.string "maximum_attempts", :limit => 30
    t.string "lockout_period", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at", :null => true
    t.datetime "updated_at", :null => true
  end

  change_column :irm_password_policies, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_people", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "organization_id", :limit => 22, :collate => "utf8_bin"
    t.string "department_id", :limit => 22, :collate => "utf8_bin"
    t.string "role_id", :limit => 22, :collate => "utf8_bin"
    t.string "profile_id", :limit => 22, :collate => "utf8_bin"
    t.string "title", :limit => 30
    t.string "first_name", :limit => 30, :null => true
    t.string "last_name", :limit => 30
    t.string "full_name_pinyin", :limit => 60
    t.string "full_name", :limit => 60
    t.string "job_title", :limit => 30
    t.string "vip_flag", :limit => 1, :default => "N"
    t.string "support_staff_flag", :limit => 1, :default => "N"
    t.string "assignment_availability_flag", :limit => 1, :default => "N"
    t.string "email_address", :limit => 150
    t.string "home_phone", :limit => 30
    t.string "home_address", :limit => 30
    t.string "mobile_phone", :limit => 30
    t.string "fax_number", :limit => 30
    t.string "bussiness_phone", :limit => 30
    t.string "region_code", :limit => 30
    t.string "site_group_code", :limit => 30
    t.string "site_code", :limit => 30
    t.string "function_group_code", :limit => 30
    t.string "avatar_path", :limit => 150
    t.string "avatar_file_name", :limit => 30
    t.string "avatar_content_type", :limit => 30
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string "identity_id", :limit => 22, :collate => "utf8_bin"
    t.string "approve_request_mail", :limit => 30
    t.string "manager", :limit => 30
    t.string "delegate_approver", :limit => 30
    t.string "last_login_at", :limit => 30
    t.string "type", :limit => 30
    t.string "language_code", :limit => 30
    t.string "auth_source_id", :limit => 22, :collate => "utf8_bin"
    t.string "hashed_password", :limit => 60
    t.string "login_name", :limit => 30
    t.string "security_flag", :limit => 24
    t.string "unrestricted_access_flag", :limit => 30
    t.string "notification_lang", :limit => 30
    t.string "notification_flag", :limit => 30
    t.string "capacity_rating", :limit => 30
    t.integer "open_tickets"
    t.string "task_capacity_rating", :limit => 30
    t.integer "open_tasks"
    t.datetime "last_assigned_date"
    t.string "locked_flag", :limit => 1, :default => "N"
    t.datetime "locked_until_at"
    t.integer "locked_time", :default => 0
    t.datetime "password_updated_at"
    t.string "last_reset_password", :limit => 60
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "ldap_dn", :limit => 200
  end

  change_column :irm_people, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_people", ["identity_id"], :name => "IRM_PEOPLE_N1"
  add_index "irm_people", ["opu_id"], :name => "IRM_PEOPLE_N2"


  create_table "irm_permissions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "function_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "product_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 90, :null => true
    t.string "controller", :limit => 60, :null => true
    t.string "action", :limit => 60, :null => true
    t.integer "params_count", :default => 0, :null => true
    t.string "direct_get_flag", :limit => 1, :default => "Y", :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_permissions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_permissions", ["function_id", "controller", "action"], :name => "IRM_PERMISSIONS_U1", :unique => true
  add_index "irm_permissions", ["function_id"], :name => "IRM_PERMISSIONS_N1"


  create_table "irm_person_relations_tmp", :id => false, :force => true do |t|
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.string "source_type", :limit => 27, :default => "", :null => true
    t.string "person_id", :limit => 22, :collate => "utf8_bin"
  end

  add_index "irm_person_relations_tmp", ["person_id"], :name => "IRM_PERSON_RELATIONS_TMP_N2"
  add_index "irm_person_relations_tmp", ["source_type", "source_id"], :name => "IRM_PERSON_RELATONS_TMP_N3"


  create_table "irm_portal_layouts", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "layout", :limit => 60, :null => true
    t.string "default_flag", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_portal_layouts, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_portal_layouts_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "portal_layout_id", :limit => 30, :null => true
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_portal_layouts_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_portal_layouts_tl", ["portal_layout_id", "language"], :name => "IRM_PORTAL_LAYOUTS_TL_U1", :unique => true
  add_index "irm_portal_layouts_tl", ["portal_layout_id"], :name => "IRM_PORTAL_LAYOUTS_TL_N1"


  create_table "irm_portlet_configs", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "portal_code", :limit => 22
    t.string "person_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.text "config"
    t.string "portal_layout_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_portlet_configs, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_portlet_configs", ["person_id"], :name => "IRM_PORTLET_CONFIGS_N1"


  create_table "irm_portlets", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "code", :limit => 60, :null => true
    t.string "controller", :limit => 50, :null => true
    t.string "action", :limit => 40, :null => true
    t.string "default_flag", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_portlets, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_portlets", ["code"], :name => "IRM_PORTLETS_N1"


  create_table "irm_portlets_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "portlet_id", :limit => 22, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_portlets_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_portlets_tl", ["portlet_id", "language"], :name => "IRM_PORTLETS_TL_U1", :unique => true
  add_index "irm_portlets_tl", ["portlet_id"], :name => "IRM_PORTLETS_TL_N1"


  create_table "irm_product_modules", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "product_short_name", :limit => 30, :null => true
    t.string "installed_flag", :limit => 1
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_product_modules, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_product_modules_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "product_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_product_modules_tl, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_profile_applications", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "profile_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "application_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "default_flag", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_profile_applications, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_profile_applications", ["profile_id", "application_id"], :name => "IRM_PROFILE_APPLICATIONS_U1", :unique => true


  create_table "irm_profile_functions", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "profile_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "function_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_profile_functions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_profile_functions", ["profile_id", "function_id"], :name => "IRM_PROFILE_FUNCTIONS_U1", :unique => true


  create_table "irm_profile_kanbans", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "profile_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "kanban_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_profile_kanbans, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_profiles", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "user_license", :limit => 30, :null => true
    t.string "code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "kanban_id", :limit => 22, :collate => "utf8_bin"
  end

  change_column :irm_profiles, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_profiles", ["code", "opu_id"], :name => "IRM_PROFILES_U1", :unique => true


  create_table "irm_profiles_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "profile_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_profiles_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_profiles_tl", ["profile_id", "language"], :name => "IRM_PROFILES_TL_U1", :unique => true


  create_table "irm_rating_config_grades", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "rating_config_id", :limit => 22, :collate => "utf8_bin"
    t.integer "grade"
    t.string "name", :limit => 150
    t.string "description", :limit => 240
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_rating_config_grades, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_rating_configs", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "code", :limit => 30
    t.string "name", :limit => 150
    t.string "description", :limit => 240
    t.string "display_style", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_rating_configs, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_ratings", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "rating_object_id", :limit => 22, :collate => "utf8_bin"
    t.string "bo_name", :limit => 30, :null => true
    t.string "person_id", :limit => 22, :collate => "utf8_bin"
    t.string "grade", :limit => 10, :default => "1", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_ratings, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_recently_objects", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "source_type", :limit => 30
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_recently_objects, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_regions", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "region_code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_regions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_regions", ["region_code"], :name => "IRM_REGIONS_U1"


  create_table "irm_regions_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "region_id", :limit => 22, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_regions_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_regions_tl", ["region_id", "language"], :name => "IRM_REGIONS_TL_U1"


  create_table "irm_report_columns", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "field_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.integer "seq_num", :null => true
    t.string "summary_type", :limit => 30
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_columns, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_columns", ["field_id"], :name => "IRM_REPORT_COLUMNS_N2"
  add_index "irm_report_columns", ["report_id"], :name => "IRM_REPORT_COLUMNS_N1"


  create_table "irm_report_criterions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "field_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "param_flag", :limit => 1, :default => "N"
    t.integer "seq_num", :null => true
    t.string "operator_code", :limit => 30
    t.string "filter_value", :limit => 150
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_criterions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_criterions", ["field_id"], :name => "IRM_REPORT_CRITERIONS_N2"
  add_index "irm_report_criterions", ["report_id"], :name => "IRM_REPORT_CRITERIONS_N1"


  create_table "irm_report_folder_members", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_folder_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "member_type", :limit => 30, :null => true
    t.string "member_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_folder_members, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_report_folders", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "access_type", :limit => 22, :null => true
    t.string "member_type", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_folders, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_folders", ["code", "opu_id"], :name => "IRM_REPORT_FOLDERS_U1", :unique => true


  create_table "irm_report_folders_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_folder_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_folders_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_folders_tl", ["report_folder_id", "language"], :name => "IRM_REPORT_FOLDERS_TL_U1", :unique => true


  create_table "irm_report_group_columns", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "field_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.integer "seq_num", :null => true
    t.string "group_flag", :limit => 1, :default => "N"
    t.string "sort_type", :limit => 30
    t.string "group_date_type", :limit => 150
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_group_columns, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_group_columns", ["field_id"], :name => "IRM_REPORT_GROUP_COLUMNS_N2"
  add_index "irm_report_group_columns", ["report_id"], :name => "IRM_REPORT_GROUP_COLUMNS_N1"


  create_table "irm_report_receivers", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_trigger_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "receiver_type", :limit => 30, :null => true
    t.string "receiver_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_receivers, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_report_request_histories", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "executed_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "execute_type", :limit => 30, :null => true
    t.string "trigger_id", :limit => 22, :collate => "utf8_bin"
    t.text "params"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_request_histories, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_request_histories", ["report_id"], :name => "IRM_RPT_REQUEST_HISTORIES_N1"


  create_table "irm_report_schedules", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_trigger_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "run_at", :null => true
    t.string "run_at_str", :limit => 30
    t.string "run_status", :limit => 30, :default => "PENDING"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_schedules, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_report_triggers", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "report_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "person_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "receiver_type", :limit => 22, :null => true
    t.text "time_mode", :null => true
    t.date "start_at", :null => true
    t.date "end_at", :null => true
    t.datetime "start_time"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_triggers, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_triggers", ["report_id"], :name => "IRM_REPORT_TRIGGERS_N1"


  create_table "irm_report_type_categories", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_type_categories, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_type_categories", ["code", "opu_id"], :name => "IRM_REPORT_TYPE_CATEGORIES_U1", :unique => true


  create_table "irm_report_type_categories_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_type_category_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_type_categories_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_type_categories_tl", ["report_type_category_id", "language"], :name => "IRM_RPT_TYPE_CATEGORIES_TL_U1", :unique => true


  create_table "irm_report_type_fields", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "section_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "object_attribute_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "default_selection_flag", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_type_fields, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_type_fields", ["section_id"], :name => "IRM_REPORT_TYPE_FIELDS_N1"


  create_table "irm_report_type_objects", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_type_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "object_sequence", :limit => 1, :null => true
    t.string "relationship_type", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_type_objects, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_type_objects", ["report_type_id", "business_object_id"], :name => "IRM_REPORT_TYPE_OBJECTS_U1", :unique => true
  add_index "irm_report_type_objects", ["report_type_id"], :name => "IRM_REPORT_TYPE_OBJECTS_N1"


  create_table "irm_report_type_sections", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_type_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.integer "section_sequence", :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_type_sections, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_type_sections", ["report_type_id"], :name => "IRM_REPORT_TYPE_SECTIONS_N1"


  create_table "irm_report_types", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "category_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_types, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_types", ["code", "opu_id"], :name => "IRM_REPORT_TYPE_U1", :unique => true


  create_table "irm_report_types_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_type_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_report_types_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_report_types_tl", ["report_type_id", "language"], :name => "IRM_REPORT_TYPES_TL_U1", :unique => true


  create_table "irm_reports", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "attachment_version_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_type_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_folder_id", :limit => 22, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "program", :limit => 60
    t.string "program_type", :limit => 30, :default => "CUSTOM"
    t.string "chart_type", :limit => 30
    t.text "program_params"
    t.string "detail_display_flag", :limit => 1, :default => "Y", :null => true
    t.string "auto_run_flag", :limit => 1, :default => "N", :null => true
    t.string "group_field_id", :limit => 22, :collate => "utf8_bin"
    t.string "filter_date_field_id", :limit => 22, :collate => "utf8_bin"
    t.string "filter_date_range_type", :limit => 30
    t.datetime "filter_date_from"
    t.datetime "filter_date_to"
    t.string "limit_field_id", :limit => 22, :collate => "utf8_bin"
    t.string "limit_field_order", :limit => 22
    t.integer "limit_record_count"
    t.string "raw_condition_clause", :limit => 240
    t.string "condition_clause", :limit => 240
    t.text "query_str_cache"
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_reports, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_reports", ["code", "opu_id"], :name => "IRM_REPORTS_U1", :unique => true


  create_table "irm_reports_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "report_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_reports_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_reports_tl", ["report_id", "language"], :name => "IRM_REPORTS_TL_U1", :unique => true


  create_table "irm_role_explosions", :force => true do |t|
    t.string "parent_role_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "direct_parent_role_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "role_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_role_explosions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_role_explosions", ["parent_role_id", "direct_parent_role_id", "role_id"], :name => "IRM_ROLE_EXPLOSIONS_U1", :unique => true


  create_table "irm_roles", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "report_to_role_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_roles, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_roles", ["code"], :name => "IRM_ROLES_N1"


  create_table "irm_roles_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "role_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 60, :null => true
    t.string "description", :limit => 150, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_roles_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_roles_tl", ["role_id", "language"], :name => "IRM_ROLES_TL_U1", :unique => true


  create_table "irm_rule_filter_criterions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "rule_filter_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "attribute_name", :limit => 60
    t.integer "seq_num", :null => true
    t.string "operator_code", :limit => 30
    t.string "filter_value", :limit => 150
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_rule_filter_criterions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_rule_filter_criterions", ["rule_filter_id"], :name => "IRM_RULE_FILTER_CRITERIONS_N1"


  create_table "irm_rule_filters", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bo_code", :limit => 30, :null => true
    t.string "filter_type", :limit => 30, :null => true
    t.string "filter_name", :limit => 150
    t.string "filter_code", :limit => 30
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.string "source_type", :limit => 60
    t.string "source_code", :limit => 30
    t.string "data_range", :limit => 1, :default => "Y"
    t.string "own_id", :limit => 22, :collate => "utf8_bin"
    t.string "default_flag", :limit => 1, :default => "N"
    t.string "restrict_visibility", :limit => 1, :default => "N"
    t.string "raw_condition_clause", :limit => 150
    t.string "condition_clause", :limit => 1000
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_rule_filters, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_rule_filters", ["filter_code", "source_code"], :name => "IRM_RULE_FILTERS_N1"
  add_index "irm_rule_filters", ["source_id", "source_type"], :name => "IRM_RULE_FILTERS_N2"


  create_table "irm_search_layout_columns", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "search_layout_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "object_attribute_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.integer "seq_num", :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_search_layout_columns, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_search_layouts", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_search_layouts, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_sequences", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "object_name", :limit => 30
    t.integer "seq_next", :default => 1, :null => true
    t.integer "seq_length", :default => 1, :null => true
    t.integer "seq_max", :default => 1, :null => true
    t.string "rules", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_sequences, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_session_settings", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "time_out", :limit => 30
    t.string "status_code", :limit => 30, :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_session_settings, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_site_groups", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "region_code", :limit => 30, :null => true
    t.string "group_code", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_site_groups, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_site_groups", ["region_code", "group_code", "opu_id"], :name => "IRM_SITE_GROUPS_U1", :unique => true


  create_table "irm_site_groups_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "site_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_site_groups_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_site_groups_tl", ["site_group_id", "language"], :name => "IRM_SITE_GROUPS_TL_U1", :unique => true


  create_table "irm_sites", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "site_group_code", :limit => 30, :null => true
    t.string "site_code", :limit => 30, :null => true
    t.string "address_line", :limit => 150
    t.string "country", :limit => 30
    t.string "state_code", :limit => 30
    t.string "city", :limit => 30
    t.string "postal_code", :limit => 30
    t.string "timezone_code", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_sites, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_sites", ["site_group_code", "site_code"], :name => "IRM_SITES_U1", :unique => true


  create_table "irm_sites_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "site_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_sites_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_sites_tl", ["site_id", "language"], :name => "IRM_SITES_TL_U1", :unique => true


  create_table "irm_smtp_settings", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "from_address", :limit => 250, :null => true
    t.string "email_prefix", :limit => 250, :null => true
    t.string "protocol", :limit => 30
    t.string "host_name", :limit => 150
    t.string "port", :limit => 30, :default => "25"
    t.string "timeout", :limit => 30, :default => "10000"
    t.string "tls_flag", :limit => 1
    t.string "username", :limit => 60
    t.string "password", :limit => 60
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_smtp_settings, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_system_parameter_values", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "system_parameter_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "value", :limit => 240
    t.datetime "img_updated_at"
    t.integer "img_file_size"
    t.string "img_content_type", :limit => 60
    t.string "img_file_name", :limit => 60
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_system_parameter_values, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_system_parameters", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "parameter_code", :limit => 30
    t.string "content_type", :limit => 30, :null => true
    t.string "data_type", :limit => 30, :null => true
    t.text "validation_format"
    t.text "validation_content"
    t.string "validation_type", :limit => 30
    t.text "position"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_system_parameters, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_system_parameters_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "system_parameter_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 150
    t.string "description", :limit => 240
    t.string "language", :limit => 30
    t.string "source_lang", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_system_parameters_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_system_parameters_tl", ["system_parameter_id", "language"], :name => "IRM_SYSTEM_PARAMETERS_TL_U1", :unique => true


  create_table "irm_tabs", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "business_object_id", :limit => 22, :collate => "utf8_bin"
    t.string "code", :limit => 30, :null => true
    t.string "function_group_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "style_color", :limit => 30
    t.string "style_image", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_tabs, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_tabs_tl", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "tab_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "language", :limit => 30, :null => true
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 240
    t.string "source_lang", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_tabs_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_tabs_tl", ["tab_id", "language"], :name => "IRM_TABS_TL_U1", :unique => true


  create_table "irm_todo_events", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "calendar_id", :limit => 22, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 3000
    t.string "location", :limit => 240
    t.string "string", :limit => 240
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "completed"
    t.integer "percent_complete"
    t.string "priority"
    t.text "url"
    t.boolean "all_day", :default => false
    t.string "color", :limit => 30
    t.string "source_type", :limit => 30
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.text "rrule"
    t.string "parent_id", :limit => 22, :collate => "utf8_bin"
    t.string "event_status", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_todo_events, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_todo_tasks", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "calendar_id", :limit => 22, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 3000
    t.datetime "start_at"
    t.datetime "due_date"
    t.integer "duration"
    t.datetime "completed"
    t.integer "percent_complete"
    t.string "priority"
    t.text "url"
    t.string "send_email_flag", :limit => 1, :default => "N", :null => true
    t.integer "sequence"
    t.boolean "all_day", :default => false
    t.string "color", :limit => 30
    t.string "source_type", :limit => 30
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.text "rrule"
    t.string "parent_id", :limit => 22, :collate => "utf8_bin"
    t.string "task_status", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_todo_tasks, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_user_tokens", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "person_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "token", :limit => 150
    t.string "token_type", :limit => 30
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_user_tokens, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_user_tokens", ["token_type", "person_id"], :name => "IRM_TOKEN_TYPE_U1", :unique => true


  create_table "irm_watchers", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "watchable_id", :limit => 22, :collate => "utf8_bin"
    t.string "watchable_type", :limit => 30
    t.string "member_id", :limit => 22, :collate => "utf8_bin"
    t.string "member_type", :limit => 30
    t.string "deletable_flag", :limit => 1, :default => "Y"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_watchers, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_watchers", ["opu_id", "member_id", "watchable_id", "member_type"], :name => "IRM_WATCHERS_N2"
  add_index "irm_watchers", ["opu_id", "watchable_id", "watchable_type"], :name => "IRM_WATCHERS_N1"
  add_index "irm_watchers", ["watchable_id", "watchable_type", "member_id", "member_type"], :name => "U1", :unique => true


  create_table "irm_wf_approval_actions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "process_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "action_mode", :limit => 30, :null => true
    t.string "step_id", :limit => 22, :collate => "utf8_bin"
    t.string "action_type", :limit => 60, :null => true
    t.string "action_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_approval_actions, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_approval_processes", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bo_code", :limit => 30, :null => true
    t.integer "process_order"
    t.string "name", :limit => 60, :null => true
    t.string "process_code", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "evaluate_entry_mode", :limit => 30, :null => true
    t.string "next_approver_mode", :limit => 30
    t.string "record_editability", :limit => 30, :null => true
    t.string "mail_template_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "approve_fields"
    t.string "display_history_flag", :limit => 1, :default => "Y", :null => true
    t.string "allow_submitter_recall", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :default => "OFFLINE", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_approval_processes, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_approval_step_approvers", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "step_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "approver_type", :limit => 30, :null => true
    t.string "approver_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_approval_step_approvers, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_approval_steps", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "process_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.integer "step_number", :null => true
    t.string "name", :limit => 60, :null => true
    t.string "step_code", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "evaluate_mode", :limit => 30
    t.string "evaluate_result", :limit => 30
    t.string "approver_mode", :limit => 30, :null => true
    t.string "multiple_approver_mode", :limit => 30, :null => true
    t.string "allow_delegation_approve", :limit => 1, :default => "N", :null => true
    t.string "reject_behavior", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_approval_steps, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_approval_submitters", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "process_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "submitter_type", :limit => 30, :null => true
    t.string "submitter_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_approval_submitters, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_field_updates", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bo_code", :limit => 30, :null => true
    t.string "name", :limit => 60, :null => true
    t.string "field_update_code", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "relation_bo", :limit => 30
    t.string "object_attribute", :limit => 30, :null => true
    t.string "value_type", :limit => 30, :null => true
    t.string "value", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_field_updates, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_mail_alerts", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 60, :null => true
    t.string "mail_alert_code", :limit => 30, :null => true
    t.string "bo_code", :limit => 30, :null => true
    t.string "description", :limit => 150
    t.string "mail_template_code", :limit => 30, :null => true
    t.string "additional_email", :limit => 250
    t.string "from_email", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_mail_alerts, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_mail_recipients", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "wf_mail_alert_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "recipient_type", :limit => 30, :null => true
    t.string "recipient_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_mail_recipients, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_process_instances", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "process_id", :limit => 22, :collate => "utf8_bin"
    t.string "next_approver_id", :limit => 22, :collate => "utf8_bin"
    t.string "bo_id", :limit => 22, :collate => "utf8_bin"
    t.string "bo_model_name"
    t.string "bo_description"
    t.string "submitter_id", :limit => 22, :collate => "utf8_bin"
    t.string "process_status_code", :limit => 30, :default => "SUBMITTED"
    t.string "comment", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_at"
  end

  change_column :irm_wf_process_instances, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_wf_process_instances", ["process_id", "bo_id"], :name => "IRM_WF_PROCESS_INSTANCES_N1"


  create_table "irm_wf_rule_actions", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "rule_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "action_mode", :limit => 30
    t.string "action_type", :limit => 60, :null => true
    t.string "action_reference_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "time_trigger_id", :limit => 22, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_rule_actions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_wf_rule_actions", ["rule_id"], :name => "IRM_WF_RULE_ACTIONS_N1"


  create_table "irm_wf_rule_histories", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "event_id", :limit => 22, :collate => "utf8_bin"
    t.string "rule_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bo_code", :limit => 30
    t.string "bo_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_rule_histories, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_wf_rule_histories", ["event_id", "rule_id"], :name => "IRM_WF_RULE_HISTORIES_N1"


  create_table "irm_wf_rule_time_triggers", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "rule_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "name", :limit => 60
    t.string "description", :limit => 150
    t.string "trigger_mode", :limit => 30, :null => true
    t.string "time_unit", :limit => 60, :null => true
    t.integer "time_lead"
    t.string "trigger_data_object", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_rule_time_triggers, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_wf_rule_time_triggers", ["rule_id"], :name => "IRM_WF_RULE_TIME_TRIGGERS_N1"


  create_table "irm_wf_rules", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "bo_code", :limit => 30, :null => true
    t.string "rule_code", :limit => 30, :null => true
    t.string "name", :limit => 60, :null => true
    t.string "description", :limit => 150
    t.string "evaluate_criteria_rule", :limit => 30, :null => true
    t.string "evaluate_rule_mode", :limit => 30, :null => true
    t.string "status_code", :limit => 30, :default => "OFFLINE", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_rules, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_wf_rules", ["bo_code"], :name => "IRM_WF_RULE_N1"
  add_index "irm_wf_rules", ["rule_code"], :name => "IRM_WF_RULE_N2"


  create_table "irm_wf_settings", :force => true do |t|
    t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "default_workflow_person_id", :limit => 22, :collate => "utf8_bin"
    t.string "email_approval_flag", :limit => 1, :default => "N", :null => true
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_settings, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "irm_wf_step_instances", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "process_instance_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "batch_id", :limit => 22, :collate => "utf8_bin"
    t.string "step_id", :limit => 22, :null => true, :collate => "utf8_bin"
    t.string "assign_approver_id", :limit => 22, :collate => "utf8_bin"
    t.string "actual_approver_id", :limit => 22, :collate => "utf8_bin"
    t.string "approval_status_code", :limit => 30, :default => "PENDING"
    t.string "comment", :limit => 150
    t.string "status_code", :limit => 30, :default => "ENABLED"
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_at"
  end

  change_column :irm_wf_step_instances, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "irm_wf_step_instances", ["actual_approver_id"], :name => "IRM_WF_STEP_INSTANCES_N2"
  add_index "irm_wf_step_instances", ["process_instance_id", "step_id"], :name => "IRM_WF_STEP_INSTANCES_N1"


  create_table "irm_wf_tasks", :force => true do |t|
    t.string "opu_id", :limit => 22, :collate => "utf8_bin"
    t.string "calendar_id", :limit => 22, :collate => "utf8_bin"
    t.string "name", :limit => 150, :null => true
    t.string "description", :limit => 3000
    t.string "location", :limit => 240
    t.string "string", :limit => 240
    t.datetime "start_at"
    t.datetime "end_at"
    t.datetime "completed"
    t.integer "percent_complete"
    t.string "priority", :limit => 30
    t.text "url"
    t.boolean "all_day", :default => false
    t.string "color", :limit => 30
    t.string "source_type", :limit => 30
    t.string "source_id", :limit => 22, :collate => "utf8_bin"
    t.string "task_status", :limit => 30
    t.string "parent_id", :limit => 22, :collate => "utf8_bin"
    t.text "rrule"
    t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
    t.string "created_by", :limit => 22, :collate => "utf8_bin"
    t.string "updated_by", :limit => 22, :collate => "utf8_bin"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :irm_wf_tasks, "id", :string, :limit => 22, :collate => "utf8_bin"

  create_table "sessions", :force => true do |t|
    t.string "session_id", :null => true
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  change_column :sessions, "id", :string, :limit => 22, :collate => "utf8_bin"
  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"


  #create_table "skm_book_wikis", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "book_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "wiki_id", :limit => 22, :collate => "utf8_bin"
  #  t.integer "display_sequence", :default => 0
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_book_wikis, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_books", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.string "private_flag", :limit => 1, :default => "N"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_books, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_channel_approval_people", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "channel_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_channel_approval_people, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "skm_channel_approval_people", ["channel_id", "person_id"], :name => "SKM_CHANNEL_APPROVAL_U1", :unique => true
  #
  #
  #create_table "skm_channel_columns", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "channel_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "column_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_channel_columns, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_channel_groups", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "channel_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "group_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_channel_groups, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_channels", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "channel_code", :limit => 30
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_channels, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_channels_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "channel_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "name", :limit => 30, :null => true
  #  t.string "description", :limit => 150
  #  t.string "language", :limit => 30
  #  t.string "source_lang", :limit => 30
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_channels_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_column_accesses", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "column_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "source_type", :limit => 30
  #  t.string "source_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at", :null => true
  #  t.datetime "updated_at", :null => true
  #end
  #
  #change_column :skm_column_accesses, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_columns", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "parent_column_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "column_code", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at", :null => true
  #  t.datetime "updated_at", :null => true
  #end
  #
  #change_column :skm_columns, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "skm_columns", ["column_code", "opu_id"], :name => "SKM_COLUMNS_U1", :unique => true
  #
  #
  #create_table "skm_columns_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "column_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "name", :limit => 150, :null => true
  #  t.string "description", :limit => 240
  #  t.string "language", :limit => 30, :null => true
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at", :null => true
  #  t.datetime "updated_at", :null => true
  #end
  #
  #change_column :skm_columns_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "skm_columns_tl", ["column_id", "language"], :name => "SKM_COLUMNS_TL_U1", :unique => true
  #add_index "skm_columns_tl", ["column_id"], :name => "SKM_COLUMNS_TL_N1"
  #
  #
  #create_table "skm_entry_approval_people", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_header_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "approval_flag", :limit => 1, :default => "N"
  #  t.string "pre_approval_id", :limit => 22, :default => "", :collate => "utf8_bin"
  #  t.string "next_approval_id", :limit => 22, :default => "", :collate => "utf8_bin"
  #  t.text "note"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_approval_people, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "skm_entry_approval_people", ["entry_header_id", "person_id"], :name => "SKM_ENTRY_APPROVAL_U1", :unique => true
  #
  #
  #create_table "skm_entry_details", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_header_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "element_name", :limit => 60, :null => true
  #  t.string "element_description", :limit => 150
  #  t.integer "default_rows", :default => 4
  #  t.string "entry_template_element_id", :limit => 22, :collate => "utf8_bin"
  #  t.text "entry_content"
  #  t.string "required_flag", :limit => 1
  #  t.integer "line_num"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_details, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_favorites", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_header_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "person_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at", :null => true
  #  t.datetime "updated_at", :null => true
  #end
  #
  #change_column :skm_entry_favorites, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_header_relations", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "source_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "target_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "relation_type", :limit => 10, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_header_relations, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "skm_entry_header_relations", ["source_id", "target_id"], :name => "SKM_ENTRY_HEADER_RELATION_U1", :unique => true
  #
  #
  #create_table "skm_entry_headers", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "channel_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "entry_template_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_title", :limit => 60, :null => true
  #  t.string "keyword_tags", :limit => 150
  #  t.string "doc_number", :limit => 30
  #  t.string "history_flag", :limit => 1, :default => "N"
  #  t.string "entry_status_code", :limit => 30
  #  t.string "version_number", :limit => 30
  #  t.datetime "published_date"
  #  t.string "author_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "source_type", :limit => 30
  #  t.string "source_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "type_code", :limit => 30
  #  t.string "relation_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_headers, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_operate_histories", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "operate_code", :null => true
  #  t.string "incident_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "entry_id", :limit => 22, :collate => "utf8_bin"
  #  t.integer "version_number"
  #  t.string "search_key", :limit => 50
  #  t.integer "result_count"
  #  t.integer "var_num1"
  #  t.integer "var_num2"
  #  t.integer "var_num3"
  #  t.string "var_str1", :limit => 50
  #  t.string "var_str2", :limit => 50
  #  t.string "var_str3", :limit => 50
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_operate_histories, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_statuses", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_status_code", :limit => 30, :null => true
  #  t.string "visiable_flag", :limit => 1, :default => "Y"
  #  t.string "display_color", :limit => 7
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_statuses, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_statuses_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_status_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "name", :limit => 60, :null => true
  #  t.string "description", :limit => 150
  #  t.string "language", :limit => 30, :null => true
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_statuses_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "skm_entry_statuses_tl", ["entry_status_id", "language"], :name => "SKM_ENTRY_STATUSES_TL_U1", :unique => true
  #add_index "skm_entry_statuses_tl", ["entry_status_id"], :name => "SKM_ENTRY_STATUSES_TL_N1"
  #
  #
  #create_table "skm_entry_subjects", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_header_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "subject_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_subjects, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_template_details", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_template_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_template_element_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.integer "line_num"
  #  t.string "required_flag", :limit => 1, :default => "N"
  #  t.integer "default_rows", :default => 4
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_template_details, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_template_elements", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_template_element_code", :limit => 30, :null => true
  #  t.integer "default_rows", :default => 4
  #  t.string "name", :limit => 60, :null => true
  #  t.string "description", :limit => 150
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_template_elements, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_entry_templates", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "entry_template_code", :limit => 30, :null => true
  #  t.string "name", :limit => 60, :null => true
  #  t.string "description", :limit => 150
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_entry_templates, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_file_operate_histories", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "operate_code", :null => true
  #  t.string "attachment_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "version_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "file_name"
  #  t.integer "var_num1"
  #  t.integer "var_num2"
  #  t.integer "var_num3"
  #  t.string "var_str1", :limit => 50
  #  t.string "var_str2", :limit => 50
  #  t.string "var_str3", :limit => 50
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_file_operate_histories, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_settings", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "sidebar_flag", :limit => 1, :default => "Y", :null => true
  #  t.string "sidebar_file_menu_flag", :limit => 1, :default => "N", :null => true
  #  t.string "status_code", :limit => 30, :default => "ENABLED", :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_settings, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_wiki_templates", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "name", :limit => 150
  #  t.string "description", :limit => 240
  #  t.text "content"
  #  t.string "content_format", :limit => 30
  #  t.string "private_flag", :limit => 1, :default => "N"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_wiki_templates, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "skm_wikis", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "file_name", :limit => 240
  #  t.string "name", :limit => 150
  #  t.string "channel_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "tags", :limit => 150
  #  t.string "num", :limit => 30
  #  t.string "description", :limit => 240
  #  t.text "table_of_content"
  #  t.text "content"
  #  t.string "content_format", :limit => 30
  #  t.string "private_flag", :limit => 1, :default => "N"
  #  t.string "source_type", :limit => 60
  #  t.string "source_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "entry_status_code", :limit => 30
  #  t.string "sync_flag", :limit => 1, :default => "N"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :skm_wikis, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "slm_service_agreements", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "agreement_code", :limit => 30
  #  t.date "active_start_date"
  #  t.date "active_end_date"
  #  t.integer "response_time"
  #  t.integer "resolve_time"
  #  t.string "business_object_code", :limit => 30
  #  t.string "rule_filter_code", :limit => 30
  #  t.string "response_escalation_enabled", :limit => 1
  #  t.string "rs_first_escalation_mode", :limit => 30
  #  t.integer "rs_first_elapse_time"
  #  t.string "rs_first_assignee_type"
  #  t.string "rs_first_escalation_assignee"
  #  t.string "first_escalation_enabled", :limit => 1
  #  t.string "first_escalation_mode", :limit => 30
  #  t.integer "first_elapse_time"
  #  t.string "first_assignee_type", :limit => 30
  #  t.string "first_escalation_assignee", :limit => 30
  #  t.string "second_escalation_enabled", :limit => 1
  #  t.string "second_escalation_mode", :limit => 30
  #  t.integer "second_elapse_time"
  #  t.string "second_assignee_type", :limit => 30
  #  t.string "second_escalation_assignee", :limit => 30
  #  t.string "third_escalation_enabled", :limit => 1
  #  t.string "third_escalation_mode", :limit => 30
  #  t.integer "third_elapse_time"
  #  t.string "third_assignee_type", :limit => 30
  #  t.string "third_escalation_assignee", :limit => 30
  #  t.string "fourth_escalation_enabled", :limit => 1
  #  t.string "fourth_escalation_mode", :limit => 30
  #  t.integer "fourth_elapse_time"
  #  t.string "fourth_assignee_type", :limit => 30
  #  t.string "fourth_escalation_assignee", :limit => 30
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.date "created_at"
  #  t.date "updated_at"
  #  t.string "service_company_id", :limit => 22, :collate => "utf8_bin"
  #end
  #
  #change_column :slm_service_agreements, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "slm_service_agreements", ["agreement_code"], :name => "SLM_SERVICE_AGREEMENTS_N1"
  #
  #
  #create_table "slm_service_agreements_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "service_agreement_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "name", :limit => 30
  #  t.string "description", :limit => 150, :null => true
  #  t.string "language", :limit => 30, :null => true
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.date "created_at"
  #  t.date "updated_at"
  #end
  #
  #change_column :slm_service_agreements_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "slm_service_breaks", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "service_catalog_id", :limit => 22, :collate => "utf8_bin"
  #  t.integer "seq_number"
  #  t.string "start_time", :limit => 30
  #  t.string "end_time", :limit => 30
  #  t.string "description", :limit => 150
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.date "created_at"
  #  t.date "updated_at"
  #end
  #
  #change_column :slm_service_breaks, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "slm_service_breaks", ["service_catalog_id", "seq_number"], :name => "SLM_SERVICE_BREAKS_N1"
  #
  #
  #create_table "slm_service_catalog_explosions", :force => true do |t|
  #  t.string "parent_service_catalog_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "direct_parent_service_cat_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "service_catalog_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :slm_service_catalog_explosions, "id", :string, :limit => 22, :collate => "utf8_bin"
  #
  #create_table "slm_service_catalogs", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "catalog_code", :limit => 30
  #  t.string "parent_catalog_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "slm_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "service_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "priority_code", :limit => 30
  #  t.date "active_start_date"
  #  t.date "active_end_date"
  #  t.string "service_owner_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "statistics_api", :limit => 60
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :slm_service_catalogs, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "slm_service_catalogs", ["opu_id", "catalog_code"], :name => "SLM_SERVICE_CATALOGS_N1"
  #
  #
  #create_table "slm_service_catalogs_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "service_catalog_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "name", :limit => 30
  #  t.string "description", :limit => 150, :null => true
  #  t.string "language", :limit => 30, :null => true
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.date "created_at"
  #  t.date "updated_at"
  #end
  #
  #change_column :slm_service_catalogs_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "slm_service_catalogs_tl", ["service_catalog_id", "language"], :name => "SLM_SERVICE_CATALOGS_TL_N1"
  #
  #
  #create_table "slm_service_categories", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "category_code", :limit => 30
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :slm_service_categories, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "slm_service_categories", ["opu_id", "category_code"], :name => "SLM_SERVICE_CATEGORIES_N1"
  #
  #
  #create_table "slm_service_categories_tl", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "service_category_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "name", :limit => 30
  #  t.string "description", :limit => 150, :null => true
  #  t.string "language", :limit => 30, :null => true
  #  t.string "source_lang", :limit => 30, :null => true
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.date "created_at"
  #  t.date "updated_at"
  #end
  #
  #change_column :slm_service_categories_tl, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "slm_service_categories_tl", ["service_category_id", "language"], :name => "SLM_SERVICE_CATEGORIES_TL_N1"
  #
  #
  #create_table "slm_service_members", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :null => true, :collate => "utf8_bin"
  #  t.string "service_catalog_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "external_system_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :null => true
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.date "created_at"
  #  t.date "updated_at"
  #end
  #
  #change_column :slm_service_members, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "slm_service_members", ["service_catalog_id"], :name => "SLM_SERVICE_MEMBERS_N1"
  #
  #
  #create_table "uid_external_logins", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "external_system_code", :limit => 30
  #  t.string "external_login_name", :limit => 60
  #  t.string "external_login_id", :limit => 22, :collate => "utf8_bin"
  #  t.date "active_start_date"
  #  t.date "active_end_date"
  #  t.string "source_type", :limit => 30
  #  t.string "description", :limit => 300
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :uid_external_logins, "id", :string, :limit => 22, :collate => "utf8_bin"
  #add_index "uid_external_logins", ["opu_id", "external_system_code", "external_login_name", "external_login_id"], :name => "UID_EXTERNAL_LOGINS_N1"
  #
  #
  #create_table "uid_user_login_mappings", :force => true do |t|
  #  t.string "opu_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "external_system_code", :limit => 30
  #  t.string "external_login_name", :limit => 30
  #  t.string "person_id", :limit => 22, :collate => "utf8_bin"
  #  t.string "status_code", :limit => 30, :default => "ENABLED"
  #  t.string "created_by", :limit => 22, :collate => "utf8_bin"
  #  t.string "updated_by", :limit => 22, :collate => "utf8_bin"
  #  t.datetime "created_at"
  #  t.datetime "updated_at"
  #end
  #
  #change_column :uid_user_login_mappings, "id", :string, :limit => 22, :collate => "utf8_bin"

  #execute("CREATE OR REPLACE VIEW  chm_change_impacts_vl  AS SELECT  t.id,t.opu_id,t.code,t.weight_values,t.display_sequence,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (chm_change_impacts t join chm_change_impacts_tl tl on((t.id = tl.change_impact_id)))")
  #execute("CREATE OR REPLACE VIEW  chm_change_plan_types_vl  AS SELECT  t.id,t.opu_id,t.code,t.display_sequence,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (chm_change_plan_types t join chm_change_plan_types_tl tl on((t.id = tl.change_plan_type_id)))")
  #execute("CREATE OR REPLACE VIEW  chm_change_priorities_vl  AS SELECT  t.id,t.opu_id,t.code,t.weight_values,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (chm_change_priorities t join chm_change_priorities_tl tl on((t.id = tl.change_priority_id)))")
  #execute("CREATE OR REPLACE VIEW  chm_change_statuses_vl  AS SELECT  t.id,t.opu_id,t.code,t.display_sequence,t.display_color,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (chm_change_statuses t join chm_change_statuses_tl tl on((t.id = tl.change_status_id)))")
  #execute("CREATE OR REPLACE VIEW  chm_change_task_phases_vl  AS SELECT  t.id,t.opu_id,t.code,t.display_sequence,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (chm_change_task_phases t join chm_change_task_phases_tl tl on((t.id = tl.change_task_phase_id)))")
  #execute("CREATE OR REPLACE VIEW  chm_change_task_templates_vl  AS SELECT  t.id,t.opu_id,t.code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (chm_change_task_templates t join chm_change_task_templates_tl tl on((t.id = tl.change_task_template_id)))")
  #execute("CREATE OR REPLACE VIEW  chm_change_urgencies_vl  AS SELECT  t.id,t.opu_id,t.code,t.weight_values,t.display_sequence,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (chm_change_urgencies t join chm_change_urgencies_tl tl on((t.id = tl.change_urgency_id)))")
  #execute("CREATE OR REPLACE VIEW  com_config_attributes_vl  AS SELECT  t.id,t.opu_id,t.code,t.config_class_id,t.input_type,t.input_value,t.regular,t.required_flag,t.display_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (com_config_attributes t join com_config_attributes_tl tl on((t.id = tl.config_attribute_id)))")
  #execute("CREATE OR REPLACE VIEW  com_config_classes_attr_vl  AS SELECT  ca.id,ca.code,ca.config_class_id,ca.input_type,ca.input_value,ca.regular,ca.required_flag from com_config_attributes ca union all select ca.id,ca.code,cce.config_class_id,ca.input_type,ca.input_value,ca.regular,ca.required_flag from com_config_class_explosions cce join com_config_attributes ca on ca.config_class_id = cce.parent_id")
  #execute("CREATE OR REPLACE VIEW  com_config_classes_vl  AS SELECT  t.id,t.opu_id,t.code,t.leaf_flag,t.parent_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (com_config_classes t join com_config_classes_tl tl on((t.id = tl.config_class_id)))")
  #execute("CREATE OR REPLACE VIEW  com_config_item_statuses_vl  AS SELECT  t.id,t.opu_id,t.code,t.display_sequence,t.display_color,t.default_flag,t.close_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (com_config_item_statuses t join com_config_item_statuses_tl tl on((t.id = tl.config_item_status_id)))")
  #execute("CREATE OR REPLACE VIEW  com_config_relation_types_vl  AS SELECT  t.id,t.opu_id,t.code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (com_config_relation_types t join com_config_relation_types_tl tl on((t.id = tl.config_relation_type_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_close_reasons_vl  AS SELECT  t.id,t.opu_id,t.close_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_close_reasons t join icm_close_reasons_tl tl on((t.id = tl.close_reason_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_impact_ranges_vl  AS SELECT  t.id,t.opu_id,t.impact_code,t.display_sequence,t.default_flag,t.weight_values,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_impact_ranges t join icm_impact_ranges_tl tl on((t.id = tl.impact_range_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_incident_categories_vl  AS SELECT  t.id,t.opu_id,t.code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_incident_categories t join icm_incident_categories_tl tl on((t.id = tl.incident_category_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_incident_phases_vl  AS SELECT  t.id,t.opu_id,t.phase_code,t.display_sequence,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_incident_phases t join icm_incident_phases_tl tl on((t.id = tl.incident_phase_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_incident_statuses_vl  AS SELECT  t.id,t.opu_id,t.incident_status_code,t.phase_code,t.display_sequence,t.display_color,t.default_flag,t.close_flag,t.permanent_close_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_incident_statuses t join icm_incident_statuses_tl tl on((t.id = tl.incident_status_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_incident_sub_categories_vl  AS SELECT  t.id,t.opu_id,t.code,t.incident_category_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_incident_sub_categories t join icm_incident_sub_categories_tl tl on((t.id = tl.incident_sub_category_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_priority_codes_vl  AS SELECT  t.id,t.opu_id,t.priority_code,t.weight_values,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_priority_codes t join icm_priority_codes_tl tl on((t.id = tl.priority_code_id)))")
  #execute("CREATE OR REPLACE VIEW  icm_support_groups_vl  AS SELECT  t.id,t.group_id,t.assignment_process_code,t.vendor_flag,t.oncall_flag,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from icm_support_groups t join irm_groups_tl tl on (t.group_id = tl.group_id)")
  #execute("CREATE OR REPLACE VIEW  icm_urgence_codes_vl  AS SELECT  t.id,t.opu_id,t.urgency_code,t.default_flag,t.display_sequence,t.weight_values,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (icm_urgence_codes t join icm_urgence_codes_tl tl on((t.id = tl.urgence_code_id)))")
  execute("CREATE OR REPLACE VIEW  irm_applications_vl  AS SELECT  t.id,t.opu_id,t.code,t.image_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_applications t join irm_applications_tl tl on((t.id = tl.application_id)))")
  execute("CREATE OR REPLACE VIEW  irm_bu_columns_vl  AS SELECT  t.id,t.opu_id,t.parent_column_id,t.bu_column_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_bu_columns t join irm_bu_columns_tl tl on((t.id = tl.bu_column_id)))")
  execute("CREATE OR REPLACE VIEW  irm_business_objects_vl  AS SELECT  t.id,t.opu_id,t.business_object_code,t.bo_table_name,t.bo_model_name,t.auto_generate_flag,t.multilingual_flag,t.standard_flag,t.report_flag,t.workflow_flag,t.data_access_flag,t.sql_cache,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_business_objects t join irm_business_objects_tl tl on((t.id = tl.business_object_id)))")
  execute("CREATE OR REPLACE VIEW  irm_cards_vl  AS SELECT  t.id,t.card_code,t.background_color,t.font_color,t.bo_code,t.rule_filter_id,t.system_flag,t.card_url,t.title_attribute_name,t.description_attribute_name,t.date_attribute_name,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_cards t join irm_cards_tl tl on((t.id = tl.card_id)))")
  execute("CREATE OR REPLACE VIEW  irm_currencies_vl  AS SELECT  t.id,t.currency_code,t.precision,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_currencies t join irm_currencies_tl tl on((t.id = tl.currency_id)))")
  execute("CREATE OR REPLACE VIEW  irm_data_share_rules_vl  AS SELECT  t.id,t.opu_id,t.code,t.business_object_id,t.rule_type,t.source_type,t.source_id,t.target_type,t.target_id,t.access_level,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_data_share_rules t join irm_data_share_rules_tl tl on((t.id = tl.data_share_rule_id)))")
  execute("CREATE OR REPLACE VIEW  irm_external_systems_vl  AS SELECT  t.id,t.opu_id,t.external_system_code,t.external_hostname,t.external_ip_address,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.system_name,tl.system_description,tl.language,tl.source_lang from (irm_external_systems t join irm_external_systems_tl tl on((t.id = tl.external_system_id)))")
  execute("CREATE OR REPLACE VIEW  irm_flex_segments_vl  AS SELECT  t.id,t.opu_id,t.id_flex_code,t.id_flex_num,t.segment_num,t.segment_name,t.display_flag,t.display_size,t.default_type,t.default_value,t.flex_value_set_name,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.form_left_prompt,tl.form_above_prompt,tl.description,tl.language,tl.source_lang from irm_id_flex_segments t join irm_id_flex_segments_tl tl on (t.segment_name = tl.segment_name)")
  execute("CREATE OR REPLACE VIEW  irm_flex_values_vl  AS SELECT  t.id,t.opu_id,t.flex_value_set_id,t.flex_value,t.display_sequence,t.start_date_active,t.end_date_active,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.flex_value_meaning,tl.description,tl.language,tl.source_lang from (irm_flex_values t join irm_flex_values_tl tl on((t.id = tl.flex_value_id)))")
  execute("CREATE OR REPLACE VIEW  irm_formula_functions_vl  AS SELECT  t.id,t.opu_id,t.function_code,t.parameters,t.function_type,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.description,tl.language,tl.source_lang from (irm_formula_functions t join irm_formula_functions_tl tl on((t.id = tl.formula_function_id)))")
  execute("CREATE OR REPLACE VIEW  irm_function_groups_vl  AS SELECT  t.id,t.opu_id,t.zone_code,t.code,t.controller,t.action,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_function_groups t join irm_function_groups_tl tl on((t.id = tl.function_group_id)))")
  execute("CREATE OR REPLACE VIEW  irm_functions_vl  AS SELECT  t.id,t.opu_id,t.function_group_id,t.code,t.login_flag,t.public_flag,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_functions t join irm_functions_tl tl on((t.id = tl.function_id)))")
  execute("CREATE OR REPLACE VIEW  irm_groups_vl  AS SELECT  t.id,t.parent_group_id,t.code,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_groups t join irm_groups_tl tl on((t.id = tl.group_id)))")
  execute("CREATE OR REPLACE VIEW  irm_id_flex_structures_vl  AS SELECT  t.id,t.opu_id,t.id_flex_code,t.id_flex_num,t.id_flex_structure_code,t.concatenated_segment_delimiter,t.freeze_flex_definition_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.id_flex_structure_name,tl.description,tl.language,tl.source_lang from (irm_id_flex_structures t join irm_id_flex_structures_tl tl on((t.id = tl.id_flex_structure_id)))")
  execute("CREATE OR REPLACE VIEW  irm_kanbans_vl  AS SELECT  t.id,t.opu_id,t.limit,t.refresh_interval,t.kanban_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,t.position_code,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_kanbans t join irm_kanbans_tl tl on((t.id = tl.kanban_id)))")
  execute("CREATE OR REPLACE VIEW  irm_lanes_vl  AS SELECT  t.id,t.opu_id,t.lane_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_lanes t join irm_lanes_tl tl on((t.id = tl.lane_id)))")
  execute("CREATE OR REPLACE VIEW  irm_languages_vl  AS SELECT  t.id,t.opu_id,t.language_code,t.installed_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.description,tl.language,tl.source_lang from (irm_languages t join irm_languages_tl tl on((t.id = tl.language_id)))")
  execute("CREATE OR REPLACE VIEW  irm_licenses_vl  AS SELECT  t.id,t.code,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_licenses t join irm_licenses_tl tl on((t.id = tl.license_id)))")
  execute("CREATE OR REPLACE VIEW  irm_list_of_values_vl  AS SELECT  t.id,t.opu_id,t.lov_code,t.bo_code,t.where_clause,t.query_clause,t.addition_clause,t.id_column,t.value_column,t.value_column_width,t.desc_column,t.desc_column_width,t.addition_column,t.addition_column_width,t.listable_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.value_title,tl.desc_title,tl.addition_title,tl.language,tl.source_lang from (irm_list_of_values t join irm_list_of_values_tl tl on((t.id = tl.list_of_value_id)))")
  execute("CREATE OR REPLACE VIEW  irm_lookup_types_vl  AS SELECT  t.id,t.opu_id,t.product_id,t.lookup_level,t.lookup_type,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.meaning,tl.description,tl.language,tl.source_lang from (irm_lookup_types t join irm_lookup_types_tl tl on((t.id = tl.lookup_type_id)))")
  execute("CREATE OR REPLACE VIEW  irm_lookup_values_vl  AS SELECT  t.id,t.opu_id,t.lookup_type,t.lookup_code,t.start_date_active,t.end_date_active,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.meaning,tl.description,tl.language,tl.source_lang from (irm_lookup_values t join irm_lookup_values_tl tl on((t.id = tl.lookup_value_id)))")
  execute("CREATE OR REPLACE VIEW  irm_mail_templates_vl  AS SELECT  t.id,t.opu_id,t.template_code,t.template_type,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.subject,tl.mail_body,tl.parsed_template,tl.description,tl.language,tl.source_lang from (irm_mail_templates t join irm_mail_templates_tl tl on((t.id = tl.template_id)))")
  execute("CREATE OR REPLACE VIEW  irm_menu_entries_vl  AS SELECT  t.id,t.opu_id,t.menu_id,t.sub_menu_id,t.sub_function_group_id,t.display_sequence,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_menu_entries t join irm_menu_entries_tl tl on((t.id = tl.menu_entry_id)))")
  execute("CREATE OR REPLACE VIEW  irm_menus_vl  AS SELECT  t.id,t.opu_id,t.code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_menus t join irm_menus_tl tl on((t.id = tl.menu_id)))")
  execute("CREATE OR REPLACE VIEW  irm_object_attributes_vl  AS SELECT  t.id,t.opu_id,t.business_object_id,t.attribute_name,t.attribute_type,t.field_type,t.category,t.relation_exists_flag,t.relation_bo_code,t.relation_bo_id,t.relation_table_alias,t.relation_column,t.relation_object_attribute_id,t.relation_type,t.relation_where_clause,t.relation_alias_ref_id,t.lov_code,t.pick_list_code,t.data_type,t.data_length,t.data_null_flag,t.data_key_type,t.data_default_value,t.data_extra_info,t.label_flag,t.required_flag,t.update_flag,t.person_flag,t.filter_flag,t.approve_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_object_attributes t join irm_object_attributes_tl tl on((t.id = tl.object_attribute_id)))")
  execute("CREATE OR REPLACE VIEW  irm_operation_units_vl  AS SELECT  t.id,t.short_name,t.primary_person_id,t.license_id,t.default_language_code,t.default_time_zone_code,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_operation_units t join irm_operation_units_tl tl on((t.id = tl.operation_unit_id)))")
  execute("CREATE OR REPLACE VIEW  irm_organizations_vl  AS SELECT  t.id,t.opu_id,t.parent_org_id,t.short_name,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,t.ldap_dn,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_organizations t join irm_organizations_tl tl on((t.id = tl.organization_id)))")
  execute("CREATE OR REPLACE VIEW  irm_person_relations_v  AS SELECT  irm_person_relations_tmp.source_id,irm_person_relations_tmp.source_type,irm_person_relations_tmp.person_id from irm_person_relations_tmp")
  execute("CREATE OR REPLACE VIEW  irm_person_relations_v2  AS SELECT  people.id as source_id ,'IRM__PERSON' AS source_type,people.id as person_id  from irm_people people union all select people.organization_id as source_id ,'IRM__ORGANIZATION' AS source_type,people.id as person_id  from irm_people people where (people.organization_id is not null) union all select people.organization_id as source_id ,'IRM__ORGANIZATION_EXPLOSION' AS source_type,people.id as person_id  from irm_people people where (people.organization_id is not null) union all select explosions.parent_org_id as source_id ,'IRM__ORGANIZATION_EXPLOSION' AS source_type,people.id as person_id  from irm_people people join irm_organization_explosions explosions on ((people.organization_id = explosions.organization_id) and (people.organization_id is not null)) union all select people.role_id as source_id ,'IRM__ROLE' AS source_type,people.id as person_id  from irm_people people where (people.role_id is not null) union all select people.role_id as source_id ,'IRM__ROLE_EXPLOSION' AS source_type,people.id as person_id  from irm_people people where (people.role_id is not null) union all select explosions.parent_role_id as source_id ,'IRM__ROLE_EXPLOSION' AS source_type,people.id as person_id  from irm_people people join irm_role_explosions explosions on ((people.role_id = explosions.role_id) and (people.role_id is not null)) union all select people.group_id as source_id ,'IRM__GROUP' AS source_type,people.person_id from irm_group_members people union all select people.group_id as source_id ,'IRM__GROUP_EXPLOSION' AS source_type,people.person_id from irm_group_members people union all select explosions.parent_group_id as source_id ,'IRM__GROUP_EXPLOSION' AS source_type,people.person_id from irm_group_members people join irm_group_explosions explosions on ((people.group_id = explosions.group_id) and (people.group_id is not null)) union all select systems.id as source_id ,'IRM__EXTERNAL_SYSTEM' AS source_type,people.person_id from irm_external_system_people people join irm_external_systems systems on (people.external_system_id = systems.id)")
  execute("CREATE OR REPLACE VIEW  irm_portal_layouts_vl  AS SELECT  t.id,t.opu_id,t.layout,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_portal_layouts t join irm_portal_layouts_tl tl on((t.id = tl.portal_layout_id)))")
  execute("CREATE OR REPLACE VIEW  irm_portlets_vl  AS SELECT  t.id,t.opu_id,t.code,t.controller,t.action,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_portlets t join irm_portlets_tl tl on((t.id = tl.portlet_id)))")
  execute("CREATE OR REPLACE VIEW  irm_product_modules_vl  AS SELECT  t.id,t.opu_id,t.product_short_name,t.installed_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_product_modules t join irm_product_modules_tl tl on((t.id = tl.product_id)))")
  execute("CREATE OR REPLACE VIEW  irm_profiles_vl  AS SELECT  t.id,t.opu_id,t.user_license,t.code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,t.kanban_id,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_profiles t join irm_profiles_tl tl on((t.id = tl.profile_id)))")
  execute("CREATE OR REPLACE VIEW  irm_regions_vl  AS SELECT  t.id,t.opu_id,t.region_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_regions t join irm_regions_tl tl on((t.id = tl.region_id)))")
  execute("CREATE OR REPLACE VIEW  irm_report_folders_vl  AS SELECT  t.id,t.opu_id,t.code,t.access_type,t.member_type,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_report_folders t join irm_report_folders_tl tl on((t.id = tl.report_folder_id)))")
  execute("CREATE OR REPLACE VIEW  irm_report_type_categories_vl  AS SELECT  t.id,t.opu_id,t.code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_report_type_categories t join irm_report_type_categories_tl tl on((t.id = tl.report_type_category_id)))")
  execute("CREATE OR REPLACE VIEW  irm_report_types_vl  AS SELECT  t.id,t.opu_id,t.category_id,t.business_object_id,t.code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_report_types t join irm_report_types_tl tl on((t.id = tl.report_type_id)))")
  execute("CREATE OR REPLACE VIEW  irm_reports_vl  AS SELECT  t.id,t.opu_id,t.report_type_id,t.report_folder_id,t.code,t.program,t.program_type,t.chart_type,t.program_params,t.detail_display_flag,t.group_field_id,t.filter_date_field_id,t.filter_date_range_type,t.filter_date_from,t.filter_date_to,t.limit_field_id,t.limit_field_order,t.limit_record_count,t.raw_condition_clause,t.condition_clause,t.query_str_cache,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_reports t join irm_reports_tl tl on((t.id = tl.report_id)))")
  execute("CREATE OR REPLACE VIEW  irm_roles_vl  AS SELECT  t.id,t.opu_id,t.code,t.report_to_role_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_roles t join irm_roles_tl tl on((t.id = tl.role_id)))")
  #execute("CREATE OR REPLACE VIEW  irm_same_org_access_level  AS SELECT  irm_organizations.id,da1.business_object_id,(case when (isnull(da2.access_level) or (da2.access_level = '')) then da1.access_level else da2.access_level end) AS access_level from ((irm_data_accesses da1 join irm_organizations) left join irm_data_accesses da2 on(((irm_organizations.id = da2.organization_id) and (da2.business_object_id = da1.business_object_id)))) where isnull(da1.organization_id)")
  execute("CREATE OR REPLACE VIEW  irm_site_groups_vl  AS SELECT  t.id,t.opu_id,t.region_code,t.group_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_site_groups t join irm_site_groups_tl tl on((t.id = tl.site_group_id)))")
  execute("CREATE OR REPLACE VIEW  irm_sites_vl  AS SELECT  t.id,t.opu_id,t.site_group_code,t.site_code,t.address_line,t.country,t.state_code,t.city,t.postal_code,t.timezone_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_sites t join irm_sites_tl tl on((t.id = tl.site_id)))")
  execute("CREATE OR REPLACE VIEW  irm_system_parameters_vl  AS SELECT  t.id,t.opu_id,t.parameter_code,t.content_type,t.data_type,t.validation_format,t.validation_content,t.validation_type,t.position,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_system_parameters t join irm_system_parameters_tl tl on((t.id = tl.system_parameter_id)))")
  execute("CREATE OR REPLACE VIEW  irm_tabs_vl  AS SELECT  t.id,t.opu_id,t.business_object_id,t.code,t.function_group_id,t.style_color,t.style_image,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_tabs t join irm_tabs_tl tl on((t.id = tl.tab_id)))")
  #execute("CREATE OR REPLACE VIEW  skm_channels_vl  AS SELECT  t.id,t.opu_id,t.channel_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (skm_channels t join skm_channels_tl tl on((t.id = tl.channel_id)))")
  #execute("CREATE OR REPLACE VIEW  skm_columns_vl  AS SELECT  t.id,t.opu_id,t.parent_column_id,t.column_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (skm_columns t join skm_columns_tl tl on((t.id = tl.column_id)))")
  #execute("CREATE OR REPLACE VIEW  skm_entry_statuses_vl  AS SELECT  t.id,t.opu_id,t.entry_status_code,t.visiable_flag,t.display_color,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (skm_entry_statuses t join skm_entry_statuses_tl tl on((t.id = tl.entry_status_id)))")
  #execute("CREATE OR REPLACE VIEW  slm_service_agreements_vl  AS SELECT  t.id,t.opu_id,t.agreement_code,t.active_start_date,t.active_end_date,t.response_time,t.resolve_time,t.business_object_code,t.rule_filter_code,t.response_escalation_enabled,t.rs_first_escalation_mode,t.rs_first_elapse_time,t.rs_first_assignee_type,t.rs_first_escalation_assignee,t.first_escalation_enabled,t.first_escalation_mode,t.first_elapse_time,t.first_assignee_type,t.first_escalation_assignee,t.second_escalation_enabled,t.second_escalation_mode,t.second_elapse_time,t.second_assignee_type,t.second_escalation_assignee,t.third_escalation_enabled,t.third_escalation_mode,t.third_elapse_time,t.third_assignee_type,t.third_escalation_assignee,t.fourth_escalation_enabled,t.fourth_escalation_mode,t.fourth_elapse_time,t.fourth_assignee_type,t.fourth_escalation_assignee,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,t.service_company_id,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (slm_service_agreements t join slm_service_agreements_tl tl on((t.id = tl.service_agreement_id)))")
  #execute("CREATE OR REPLACE VIEW  slm_service_catalogs_vl  AS SELECT  t.id,t.opu_id,t.catalog_code,t.parent_catalog_id,t.slm_id,t.service_category_id,t.priority_code,t.active_start_date,t.active_end_date,t.service_owner_id,t.statistics_api,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (slm_service_catalogs t join slm_service_catalogs_tl tl on((t.id = tl.service_catalog_id)))")
  #execute("CREATE OR REPLACE VIEW  slm_service_categories_vl  AS SELECT  t.id,t.opu_id,t.category_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (slm_service_categories t join slm_service_categories_tl tl on((t.id = tl.service_category_id)))")

end
