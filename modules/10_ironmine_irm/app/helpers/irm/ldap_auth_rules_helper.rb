module Irm::LdapAuthRulesHelper
  def filter_operators
    [[t(:label_equal), 'E'], [t(:label_unequal), 'N']]
  end

  def get_operator_meaning(operator)
    case operator
      when 'E'
        t(:label_equal)
      when 'N'
        t(:label_unequal)
    end
  end

end
