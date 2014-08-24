class Sysdb < ActiveRecord::Migration
  def self.up
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


    create_table "irm_machine_codes", :force => true,:primary_key_trigger=>true do |t|
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


    create_table "irm_object_codes", :force => true,:primary_key_trigger=>true do |t|
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

    create_table "sessions", :force => true do |t|
      t.string "session_id", :null => true
      t.text "data"
      t.datetime "created_at"
      t.datetime "updated_at"
    end

    change_column :sessions, "id", :string, :limit => 22, :collate => "utf8_bin"
    add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
    add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"
    execute("CREATE OR REPLACE VIEW  irm_applications_vl  AS SELECT  t.id,t.opu_id,t.code,t.image_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_applications t join irm_applications_tl tl on((t.id = tl.application_id)))")
    execute("CREATE OR REPLACE VIEW  irm_bu_columns_vl  AS SELECT  t.id,t.opu_id,t.parent_column_id,t.bu_column_code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_bu_columns t join irm_bu_columns_tl tl on((t.id = tl.bu_column_id)))")
    execute("CREATE OR REPLACE VIEW  irm_business_objects_vl  AS SELECT  t.id,t.opu_id,t.business_object_code,t.bo_table_name,t.bo_model_name,t.auto_generate_flag,t.multilingual_flag,t.standard_flag,t.report_flag,t.workflow_flag,t.data_access_flag,t.sql_cache,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_business_objects t join irm_business_objects_tl tl on((t.id = tl.business_object_id)))")
    execute("CREATE OR REPLACE VIEW  irm_cards_vl  AS SELECT  t.id,t.card_code,t.background_color,t.font_color,t.bo_code,t.rule_filter_id,t.system_flag,t.card_url,t.title_attribute_name,t.description_attribute_name,t.date_attribute_name,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_cards t join irm_cards_tl tl on((t.id = tl.card_id)))")
    execute("CREATE OR REPLACE VIEW  irm_currencies_vl  AS SELECT  t.id,t.currency_code,t.precision,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_currencies t join irm_currencies_tl tl on((t.id = tl.currency_id)))")
    execute("CREATE OR REPLACE VIEW  irm_data_share_rules_vl  AS SELECT  t.id,t.opu_id,t.code,t.business_object_id,t.rule_type,t.source_type,t.source_id,t.target_type,t.target_id,t.access_level,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_data_share_rules t join irm_data_share_rules_tl tl on((t.id = tl.data_share_rule_id)))")
    execute("CREATE OR REPLACE VIEW  irm_formula_functions_vl  AS SELECT  t.id,t.opu_id,t.function_code,t.parameters,t.function_type,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.description,tl.language,tl.source_lang from (irm_formula_functions t join irm_formula_functions_tl tl on((t.id = tl.formula_function_id)))")
    execute("CREATE OR REPLACE VIEW  irm_function_groups_vl  AS SELECT  t.id,t.opu_id,t.zone_code,t.code,t.controller,t.action,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_function_groups t join irm_function_groups_tl tl on((t.id = tl.function_group_id)))")
    execute("CREATE OR REPLACE VIEW  irm_functions_vl  AS SELECT  t.id,t.opu_id,t.function_group_id,t.code,t.login_flag,t.public_flag,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_functions t join irm_functions_tl tl on((t.id = tl.function_id)))")
    execute("CREATE OR REPLACE VIEW  irm_groups_vl  AS SELECT  t.id,t.parent_group_id,t.code,t.opu_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_groups t join irm_groups_tl tl on((t.id = tl.group_id)))")
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
    execute("CREATE OR REPLACE VIEW  irm_person_relations_v2  AS SELECT  people.id as source_id ,'IRM__PERSON' AS source_type,people.id as person_id  from irm_people people union all select people.organization_id as source_id ,'IRM__ORGANIZATION' AS source_type,people.id as person_id  from irm_people people where (people.organization_id is not null) union all select people.organization_id as source_id ,'IRM__ORGANIZATION_EXPLOSION' AS source_type,people.id as person_id  from irm_people people where (people.organization_id is not null) union all select explosions.parent_org_id as source_id ,'IRM__ORGANIZATION_EXPLOSION' AS source_type,people.id as person_id  from irm_people people join irm_organization_explosions explosions on ((people.organization_id = explosions.organization_id) and (people.organization_id is not null)) union all select people.role_id as source_id ,'IRM__ROLE' AS source_type,people.id as person_id  from irm_people people where (people.role_id is not null) union all select people.role_id as source_id ,'IRM__ROLE_EXPLOSION' AS source_type,people.id as person_id  from irm_people people where (people.role_id is not null) union all select explosions.parent_role_id as source_id ,'IRM__ROLE_EXPLOSION' AS source_type,people.id as person_id  from irm_people people join irm_role_explosions explosions on ((people.role_id = explosions.role_id) and (people.role_id is not null)) union all select people.group_id as source_id ,'IRM__GROUP' AS source_type,people.person_id from irm_group_members people union all select people.group_id as source_id ,'IRM__GROUP_EXPLOSION' AS source_type,people.person_id from irm_group_members people union all select explosions.parent_group_id as source_id ,'IRM__GROUP_EXPLOSION' AS source_type,people.person_id from irm_group_members people join irm_group_explosions explosions on ((people.group_id = explosions.group_id) and (people.group_id is not null))")
    execute("CREATE OR REPLACE VIEW  irm_portal_layouts_vl  AS SELECT  t.id,t.opu_id,t.layout,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_portal_layouts t join irm_portal_layouts_tl tl on((t.id = tl.portal_layout_id)))")
    execute("CREATE OR REPLACE VIEW  irm_portlets_vl  AS SELECT  t.id,t.opu_id,t.code,t.controller,t.action,t.default_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_portlets t join irm_portlets_tl tl on((t.id = tl.portlet_id)))")
    execute("CREATE OR REPLACE VIEW  irm_product_modules_vl  AS SELECT  t.id,t.opu_id,t.product_short_name,t.installed_flag,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_product_modules t join irm_product_modules_tl tl on((t.id = tl.product_id)))")
    execute("CREATE OR REPLACE VIEW  irm_profiles_vl  AS SELECT  t.id,t.opu_id,t.user_license,t.code,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,t.kanban_id,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_profiles t join irm_profiles_tl tl on((t.id = tl.profile_id)))")
    execute("CREATE OR REPLACE VIEW  irm_roles_vl  AS SELECT  t.id,t.opu_id,t.code,t.report_to_role_id,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_roles t join irm_roles_tl tl on((t.id = tl.role_id)))")
    execute("CREATE OR REPLACE VIEW  irm_system_parameters_vl  AS SELECT  t.id,t.opu_id,t.parameter_code,t.content_type,t.data_type,t.validation_format,t.validation_content,t.validation_type,t.position,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_system_parameters t join irm_system_parameters_tl tl on((t.id = tl.system_parameter_id)))")
    execute("CREATE OR REPLACE VIEW  irm_tabs_vl  AS SELECT  t.id,t.opu_id,t.business_object_id,t.code,t.function_group_id,t.style_color,t.style_image,t.status_code,t.created_by,t.updated_by,t.created_at,t.updated_at,tl.id as lang_id ,tl.name,tl.description,tl.language,tl.source_lang from (irm_tabs t join irm_tabs_tl tl on((t.id = tl.tab_id)))")
  end

  def self.down
  end
end
