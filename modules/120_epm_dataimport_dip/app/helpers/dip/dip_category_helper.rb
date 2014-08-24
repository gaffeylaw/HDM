module Dip::DipCategoryHelper
  def get_category(type)
    Dip::DipCategory.where(:category_type => type).order("name").collect { |v| [Dip::DipCategory.get_full_path(v), v.id] }
  end
end
