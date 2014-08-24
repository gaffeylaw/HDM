class Dip::QueryModel
  attr_accessor :list

  def [](var)
    list[var.to_s.downcase]
  end
end