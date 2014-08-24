class Irm::PermissionChecker
  # 确认当前用户是否有权限访问链接
  # 页面上的链接数量太多，采用缓存将页面permission信息存储
  def self.allow_to_url?(url_options={})
    return false unless (url_options[:page_controller]||url_options[:controller]).present?&&(url_options[:page_action]||url_options[:action]).present?
    url_options.symbolize_keys!
    assigned_to_functions = Irm::MenuManager.permissions[Irm::Permission.url_key(url_options[:page_controller]||url_options[:controller],url_options[:page_action]||url_options[:action])]
    assigned_to_functions||=[]
    if assigned_to_functions
      public_functions = Irm::MenuManager.public_functions
      return true if assigned_to_functions.detect{|f| public_functions.include?(f)}
      return false unless Irm::Person.current.logged?
      login_functions = Irm::MenuManager.login_functions
      return true if assigned_to_functions.detect{|f| login_functions.include?(f)}
      return Irm::Person.current.allowed_to?(assigned_to_functions)
    end
  end

  def self.public?(url_options={})
    url_options.symbolize_keys!
    assigned_to_functions = Irm::MenuManager.permissions[Irm::Permission.url_key(url_options[:page_controller]||url_options[:controller],url_options[:page_action]||url_options[:action])]
    public_functions = Irm::MenuManager.public_functions
    return true if assigned_to_functions&&assigned_to_functions.detect{|f| public_functions.include?(f)}
    false
  end


  def self.allow_to_function?(function_code)
    function = Irm::Function.where(:code=>function_code.to_s.upcase).first
    return false unless function
    return true if Irm::MenuManager.public_functions.include?(function.id)
    return false unless Irm::Person.current.logged?
    return true if Irm::MenuManager.login_functions.include?(function.id)
    Irm::Person.current.allowed_to?([function.id])
  end

end