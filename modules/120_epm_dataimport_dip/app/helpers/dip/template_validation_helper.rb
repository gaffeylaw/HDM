module Dip::TemplateValidationHelper

  def getValidationName(id)
    (validate=Dip::Validation.where(:id=>id).first).nil? ? "" : validate.name
  end

  def getValidations(id)
    validations=""
    Dip::TemplateValidation.where(:template_column_id => id).each do |v|
      validations << "[ "
      validations << Dip::Validation.find(v.validation_id).name
      validations << "(#{v.args})"
      validations << " ] "
    end
    return validations
  end
end
