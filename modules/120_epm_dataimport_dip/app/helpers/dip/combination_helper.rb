module Dip::CombinationHelper
  def showColumn?(name)
    if (Dip::Combination.where(name+" is not null").any?)
      return true
    else
      return false
    end
  end

  def getTitle(i)
    Dip::Header.where("1=1")[i].name
  end

end
