module Dip::HeaderValueHelper
  def getHeaderValue(id)
    Dip::HeaderValue.where(:header_id => id).order("value")
  end
end
