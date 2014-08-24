class Dip::TemplateValidation < ActiveRecord::Base
  set_table_name :dip_template_validation
  query_extend
  belongs_to :validation
  belongs_to :template_column
end
