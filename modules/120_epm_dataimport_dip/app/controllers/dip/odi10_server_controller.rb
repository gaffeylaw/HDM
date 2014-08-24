class Dip::Odi10ServerController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def create
    server= Dip::Odi10Server.new
    server[:server_name]=params[:server_name]
    server[:service_url]=params[:service_url]
    server[:jdbc_driver]=params[:jdbc_driver]
    server[:jdbc_url]=params[:jdbc_url]
    server[:jdbc_user]=params[:jdbc_user]
    server[:jdbc_password]=Base64.strict_encode64(Dip::Des.encrypt(params[:jdbc_password]))
    server[:work_repository]=params[:work_repository]
    server[:odi_user]=params[:odi_user]
    server[:agent_host]=params[:agent_host]
    server[:agent_port]=params[:agent_port]
    server[:odi_password]=Base64.strict_encode64(Dip::Des.encrypt(params[:odi_password]))
    server.save
    respond_to do |format|
      format.json {
        render :json => {}.to_json
      }
    end
  end

  def update
    server= Dip::Odi10Server.find(params[:id])
    param={}
    param[:server_name]=params[:server_name]
    param[:service_url]=params[:service_url]
    param[:jdbc_driver]=params[:jdbc_driver]
    param[:jdbc_url]=params[:jdbc_url]
    param[:jdbc_user]=params[:jdbc_user]
    param[:jdbc_password]=Base64.strict_encode64(Dip::Des.encrypt(params[:jdbc_password]))
    param[:work_repository]=params[:work_repository]
    param[:odi_user]=params[:odi_user]
    param[:agent_host]=params[:agent_host]
    param[:agent_port]=params[:agent_port]
    param[:odi_password]=Base64.strict_encode64(Dip::Des.encrypt(params[:odi_password]))
    server.update_attributes(param)
    respond_to do |format|
      format.json {
        render :json => {}.to_json
      }
    end
  end

  def destroy
    valueIds=params[:valueIds]
    if (valueIds)
      valueIds.each do |v|
        server=Dip::Odi10Server.find(v)
        if (server)
          server.destroy
        end
      end
    end
    respond_to do |format|
      format.json {
        render :json => {}.to_json
      }
    end
  end

  def get_data
    servers=Dip::Odi10Server.order("server_name")
    servers= servers.match_value("server_name", params[:server_name])
    data, count=paginate(servers)
    respond_to do |format|
      format.html {
        @datas=data
        @count=count
      }
    end
  end

  def get_edit_data
    server=Dip::Odi10Server.find(params[:id])
    server[:jdbc_password]=Dip::Des.decrypt(Base64.strict_decode64(server[:jdbc_password]))
    server[:odi_password]=Dip::Des.decrypt(Base64.strict_decode64(server[:odi_password]))
    respond_to do |format|
      format.json {
        render :json => server.to_json
      }
    end
  end
end
