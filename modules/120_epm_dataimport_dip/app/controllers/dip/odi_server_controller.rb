class Dip::OdiServerController < ApplicationController
  layout "bootstrap_application_full"

  def index
    respond_to do |format|
      format.html
    end
  end

  def create
    server= Dip::OdiServer.new
    server[:server_name]=params[:server_name]
    server[:server_desc]=params[:server_desc]
    server[:url]=params[:url]
    server[:workspace]=params[:workspace]
    server[:odi_user]=params[:odi_user]
    server[:odi_pwd]=Base64.strict_encode64(Dip::Des.encrypt(params[:odi_pwd]))
    server.save
    respond_to do |format|
      format.json {
        render :json => {}.to_json
      }
    end
  end

  def update
    server= Dip::OdiServer.find(params[:id])
    param={}
    param[:server_name]=params[:server_name]
    param[:server_desc]=params[:server_desc]
    param[:url]=params[:url]
    param[:workspace]=params[:workspace]
    param[:odi_user]=params[:odi_user]
    param[:odi_pwd]=Base64.strict_encode64(Dip::Des.encrypt(params[:odi_pwd]))
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
        server=Dip::OdiServer.find(v)
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
    servers=Dip::OdiServer.order("server_name")
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
    server=Dip::OdiServer.find(params[:id])
    server[:odi_pwd]=Dip::Des.decrypt(Base64.strict_decode64(server[:odi_pwd]))
    respond_to do |format|
      format.json {
        render :json => server.to_json
      }
    end
  end
end
