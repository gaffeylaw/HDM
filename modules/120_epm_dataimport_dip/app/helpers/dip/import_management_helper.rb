module Dip::ImportManagementHelper
  def getTemplateName(id)
    Dip::Template.where(:id => id).first.name
  end

  def getStatus(type)
    case type
      when Dip::ImportStatus::STATUS[:importing_to_tmp]
        return t(:importing_to_tmp)
      when Dip::ImportStatus::STATUS[:validating]
        return t(:validating)
      when Dip::ImportStatus::STATUS[:interrupted]
        return t(:interrupted)
      when Dip::ImportStatus::STATUS[:finished]
        return t(:finished)
      when Dip::ImportStatus::STATUS[:import_to_tmp_error]
        return t(:import_to_tmp_error)
      when Dip::ImportStatus::STATUS[:validate_error]
        return t(:validate_error)
      when Dip::ImportStatus::STATUS[:transfer_error]
        return t(:transfer_error)
      when Dip::ImportStatus::STATUS[:transferring]
        return t(:transferring)
      when Dip::ImportStatus::STATUS[:program_exception]
        return t(:program_exception)
      when Dip::ImportStatus::STATUS[:end_program_error]
        return t(:end_program_error)
      else
        return t(:invalid)
    end
  end

  def getColor(type)
    case type
      when Dip::ImportStatus::STATUS[:importing_to_tmp]
        return "#00ff00"
      when Dip::ImportStatus::STATUS[:validating]
        return "#00ff00"
      when Dip::ImportStatus::STATUS[:interrupted]
        return "#ff0000"
      when Dip::ImportStatus::STATUS[:finished]
        return "#ffffff"
      when Dip::ImportStatus::STATUS[:import_to_tmp_error]
        return "#ff0000"
      when Dip::ImportStatus::STATUS[:validate_error]
        return "#ff0000"
      when Dip::ImportStatus::STATUS[:transfer_error]
        return "#ff0000"
      when Dip::ImportStatus::STATUS[:program_exception]
        return "#ff0000"
      when Dip::ImportStatus::STATUS[:end_program_error]
        return "#ff0000"
      when Dip::ImportStatus::STATUS[:transferring]
        return "#ffffff"
      else
        return "#ff0000"
    end
  end
  
 def deleteable(status)
  case status
		when Dip::ImportStatus::STATUS[:importing_to_tmp] 
			return "display:none"
		when Dip::ImportStatus::STATUS[:validating]
			return "display:none"
		else return ""
    end
  end
end
