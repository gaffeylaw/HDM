module Dip::HeaderHelper
  def getHeaders()
    Dip::Header.order("id").all
  end

  def get_header_for_select
    Dip::Header.order("id").collect { |h| [h.name, h.id] }
  end
end
