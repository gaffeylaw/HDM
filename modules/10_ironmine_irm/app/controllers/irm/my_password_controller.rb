class Irm::MyPasswordController < ApplicationController
  #个人信息显示页面
  def index
    redirect_to({:action=>"edit_password"})
  end

  # 个人密码修改页面
  def edit_password
    @person = Irm::Person.current
  end

  # 更新个人密码
  def update_password
    @person = Irm::Person.current
    params[:irm_person][:password]="*" if params[:irm_person][:password].blank?
    respond_to do |format|
      if(params[:irm_person][:old_password] && check_password(params[:irm_person][:old_password]))
        if @person.password_same_as_before?(params[:irm_person][:password]) && @person.update_attributes(params[:irm_person])
          format.html {redirect_to({:action=>"edit_password"}, :notice => I18n.t(:successfully_updated_password))}
        else
          @person.password = "" if @person.password.eql?("*")
          format.html {render("edit_password")}
        end
      else
        @person.errors.add(:old_password,t(:label_irm_password_error))
        format.html { render("edit_password")}
      end
    end
  end

  private

  def check_password(password)
    Irm::Person.current.hashed_password.eql?(Irm::Person.hash_password(password))
  end
end
