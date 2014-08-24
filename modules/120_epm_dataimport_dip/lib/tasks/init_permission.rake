#-*- coding: utf-8 -*-
namespace :irm do
  task :init_permission => :environment do
    ironmine_id='000100012i8IyyjJaqMaJ6'
    opu_id='001n00012i8IyyjJakd6Om'
    status='ENABLED'
    profile_id='001z00024DLIQpNqVFPhLc'
    licence_id='001T00012i8IyyjJaq1Y3c'
    p 'clear irm_license_functions'
    ActiveRecord::Base.connection.execute("delete from irm_license_functions")
    p 'clear irm_profile_functions'
    ActiveRecord::Base.connection.execute("delete from irm_profile_functions")
    p 'start to create permission'
    Irm::Function.all.each do |g|
      Irm::ProfileFunction.new({:opu_id=>opu_id,:profile_id=>profile_id,:function_id=>g.id,:status_code=>status}).save
      Irm::LicenseFunction.new({:opu_id=>opu_id,:function_id=>g.id,:status_code=>status,:license_id=>licence_id}).save
    end
    p 'finish create permission'
    ActiveRecord::Base.connection.execute("update irm_mail_templates_tl t set t.mail_body='{{irm_people.full_name}}:

   Hi!Your password has been reset!Information followed:

   User Name:{{irm_people.login_name}}
   Password :{{irm_people.password}}

Please change your password in time.' where t.id='001f00024HHtlPTuJtMgd6'")
    ActiveRecord::Base.connection.execute("update irm_mail_templates_tl t set t.mail_body='{{irm_people.full_name}}:

   你好!你的密码已经被重置,你的信息如下:

   用户名:{{irm_people.login_name}}
   密   码:{{irm_people.password}}

请及时修改你的密码.' where t.id='001f00024HHtlPTuJtMy6i'")

    ActiveRecord::Base.connection.execute("update irm_mail_templates_tl t set t.mail_body='Hi, <br/>
<br/>
此邮件是HDM外部环境发出的重置密码邮件。<br/>
<br/>
您会收到此邮件，是因为您使用了HDM平台的【忘记密码】功能。如果不是您本人使用了该功能，可能是有人尝试用您的帐号进行登陆。<br/>
<br/>
现在您可以点击以下链接重置密码：<br/>
{{reset_url}}
<br/>
<br/>
该连接会在30分钟内有效。<br/>
{{datetime}}
<br/>
<br/>
本邮件由HDM系统自动发出，请勿回复。' where t.id='001f02bw2VHkkZQlkxaEdc'")
    ActiveRecord::Base.connection.execute("update irm_mail_templates_tl t set t.mail_body='Hi, <br/>
<br/>
This is a mail send by the HDM system for resetting passwrod。<br/>
<br/>
You received this mail just because you have used the reset password function in HDM system。
If you don not do this operation, maybe someone is trying to login by using your account.
<br/>
Now, you can change your password by the following link:<br/>
{{reset_url}}
<br/>
<br/>
This link will be effective in 30 minutes.<br/>
{{datetime}}
<br/>
<br/>
This mail was generated by the HDM automatically, please do not reply.' where t.id='001f02bw2VHkkZQlkxZM6i'")
  end
end