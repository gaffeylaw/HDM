module Dip::OdiInterfaceHelper

  def get_odi_server_list
    server=Dip::OdiServer.all.collect { |s| [s.server_name, s.id] }
    server+=Dip::Odi10Server.all.collect { |s| [s.server_name, s.id] }
  end

  def get_status(id,interface_id, session_id)
    result=""
    odi_interface=Dip::OdiInterface.find(interface_id)
    if odi_interface.server_version=='11'
      if Dip::InterfaceStatus.find(id).status == 'R' or  Dip::InterfaceStatus.find(id).status == 'Q' or  Dip::InterfaceStatus.find(id).status == 'W'
        ActiveRecord::Base.connection.execute("update dip_interface_statuses set (status,log,updated_at) = (select s.sess_status, substr(replace(replace(s.error_message, chr(10), ''), chr(13), ''),1,255),sysdate from snp_session_11g s where s.sess_no = #{session_id}) where session_id = #{session_id} and status <> (select sess_status from snp_session_11g  where sess_no = #{session_id})")
      end
    elsif odi_interface.server_version=='10'
      if Dip::InterfaceStatus.find(id).status == 'R' or  Dip::InterfaceStatus.find(id).status == 'Q' or  Dip::InterfaceStatus.find(id).status == 'W'
        ActiveRecord::Base.connection.execute("update dip_interface_statuses set (status,log,updated_at) = (select s.sess_status, substr(replace(replace(t.txt,chr(10),''),chr(13),''),1,255),sysdate from snp_session_10g S,snp_exp_txt_10g T where TXT_ORD(+) = 0 and S.I_TXT_SESS_MESS = T.I_TXT(+) and s.sess_no = #{session_id}) where session_id = #{session_id} and status <> (select sess_status from snp_session_10g where sess_no = #{session_id})")
      end
    end
    result = Dip::InterfaceStatus.find(id).status
    result=getStatusMsg(result)
    return result
  end

  def getodiColor(status)
    case status
      when 'Q'
        return "#00ff00"
      when 'R'
        return "#00ff00"
      when 'W'
        return "#00ff00"
      when 'D'
        return "#ffffff"
      when 'E'
        return "#ff0000"
      when 'M'
        return "#ff0000"
      else
        return "#ff0000"
    end
  end
  def get_status_color(id,code)
    result = 0
    result = Dip::OdiInterface.find(id).status.to_i
    if result == 0
      return "#ffffff"
    else return "#00ff00"
    end
  end
  def file_exist(id,session_id)
    if Dip::InterfaceStatus.find(id).status == 'R' or  Dip::InterfaceStatus.find(id).status == 'Q' or  Dip::InterfaceStatus.find(id).status == 'W'
      return false
    else
      return File.exist?("#{Rails.root}/public/upload/data/#{session_id}.zip")
    end
  end
  def get_log(id)
    return Dip::InterfaceStatus.find(id).log
  end
  def get_interface_status(id,code)
    result = 0
    #ActiveRecord::Base.connection.execute("update dip_odi_interfaces t set t.status = (select count(*) from snp_session s where (s.sess_status = 'R' or s.sess_status = 'Q' or s.sess_status = 'W') and s.scen_name = '#{code}') where t.interface_code = '#{code}'")
    result = Dip::OdiInterface.find(id).status.to_i
    return get_status_result(result)
  end
  def get_checkbox_att(id,code)
    result = 0
    html = ""
    odi_interface=Dip::OdiInterface.find(id)
    if odi_interface.server_version=='11'
      ActiveRecord::Base.connection.execute("update dip_odi_interfaces t set t.status = (select count(*) from snp_session_11g s where (s.sess_status = 'R' or s.sess_status = 'Q' or s.sess_status = 'W') and s.scen_name = '#{code}') where t.interface_code = '#{code}'")
    elsif odi_interface.server_version=='10'
      ActiveRecord::Base.connection.execute("update dip_odi_interfaces t set t.status = (select count(*) from snp_session_10g s where (s.sess_status = 'R' or s.sess_status = 'Q' or s.sess_status = 'W') and s.scen_name = '#{code}') where t.interface_code = '#{code}'")
    end
    result = Dip::OdiInterface.find(id).status.to_i
    if result > 0
      html="disabled=true"
      return html
    else
      return ""
    end
  end

=begin
    def candeleteable(status)
      case status
        when 'R'
          return "display:none"
        when 'Q'
          return "display:none"
        when 'W'
          return "display:none"
        else return ""
      end
    end
=end

  private
  def getStatusMsg(status)
    case status
      when 'D'
        return t(:label_done)
      when 'E'
        return t(:label_error)
      when 'R'
        return t(:label_running)
      when 'M'
        return t(:label_warning)
      when 'Q'
        return t(:label_queued)
      when 'W'
        return t(:label_waiting)
    end
  end

  def get_status_result(status)
    if status >= 1
      return t(:label_running)
    else
      return t(:label_odi_interface_free)
    end
  end

end
