class Dip::InfaRepository < ActiveRecord::Base
  set_table_name :dip_infa_repositories
  query_extend
  validates_presence_of :repository_name, :user_name, :service_url, :repository_alias
  has_many :infa_workflow, :foreign_key => :repository_id, :dependent => :destroy


  def self.login(repository)
    begin
      url= repository.service_url+"/services/BatchServices/Metadata?WSDL"
      client=Savon.client(url)
      client.wsdl.endpoint=url
      response=client.request :login do
        xml=""
        xml << "<RepositoryDomainName>"
        xml << repository.repository_domain_name.to_s
        xml << "</RepositoryDomainName>"
        xml << "<RepositoryName>"
        xml << repository.repository_name.to_s
        xml << "</RepositoryName>"
        xml << "<UserName>"
        xml << repository.user_name.to_s
        xml << "</UserName>"
        xml << "<Password>"
        xml << Dip::Des.decrypt(Base64.strict_decode64(repository.password.to_s))
        xml << "</Password>"
        xml << "<UserNameSpace>"
        xml << repository.user_namespace.to_s
        xml << "</UserNameSpace>"
        soap.body=xml
      end
    rescue => ex
      logger.error ex
    end
    if response
      response.to_hash[:login_return]
    end
  end

  def self.logout(repository, session_id)
    begin
      url= repository.service_url+"/services/BatchServices/Metadata?WSDL"
      client=Savon.client(url)
      client.wsdl.endpoint=url
      client.request :logout do
        xml =""
        xml << "<Context>"
        xml << "<SessionId>"
        xml << session_id
        xml << "</SessionId>"
        xml << "</Context>"
        soap.header=xml
      end
    rescue => ex
      logger.error ex
    end
  end

  def self.get_folder_list(repository, session_id)
    begin
      url= repository.service_url+"/services/BatchServices/Metadata?WSDL"
      client=Savon.client(url)
      client.wsdl.endpoint=url
      response=client.request :get_all_folders do
        xml =""
        xml << "<Context>"
        xml << "<SessionId>"
        xml << session_id
        xml << "</SessionId>"
        xml << "</Context>"
        soap.header=xml
      end
    rescue => ex
      logger.error ex
    end
    if response
      folders=response.to_hash[:get_all_folders_return][:folder_info]
      if folders.instance_of? Hash
        return [folders]
      else
        return folders
      end
    end
  end

  def self.get_workflow_list(repository, sessionId, folderName)
    begin
      url= repository.service_url+"/services/BatchServices/Metadata?WSDL"
      client=Savon.client(url)
      client.wsdl.endpoint=url
      response=client.request :get_all_workflows do
        xml =""
        xml << "<Context>"
        xml << "<SessionId>"
        xml << sessionId
        xml << "</SessionId>"
        xml << "</Context>"
        soap.header=xml
        body=""
        body << "<Name>"
        body << folderName
        body << "</Name>"
        soap.body=body
      end
    rescue => ex
      logger.error ex
    end
    if response
      workflows=response.to_hash[:get_all_workflows_return][:workflow_info]
      if workflows.instance_of? Hash
        return [workflows]
      else
        return workflows
      end
    end
  end

  def self.get_a_diServer(repository, sessionId)
    begin
      url= repository.service_url+"/services/BatchServices/Metadata?WSDL"
      client=Savon.client(url)
      client.wsdl.endpoint=url
      response=client.request :get_all_di_servers do
        xml =""
        xml << "<Context>"
        xml << "<SessionId>"
        xml << sessionId
        xml << "</SessionId>"
        xml << "</Context>"
        soap.header=xml
      end
    rescue => ex
      logger.error ex
    end
    if response
      servers=response.to_hash[:get_all_di_servers_return][:di_server_info]
      if servers.instance_of? Hash
        servers= [servers]
      end
      return servers.nil? ? nil : servers[0][:name]
    end
  end

  def self.start_workflow(repository, sessionId, workflow, server, variables)
    begin
      url= repository.service_url+"/services/BatchServices/DataIntegration?WSDL"
      client=Savon.client(url)
      client.wsdl.endpoint=url
      response=client.request :start_workflow_ex do
        xml =""
        xml << "<Context>"
        xml << "<SessionId>"
        xml << sessionId
        xml << "</SessionId>"
        xml << "</Context>"
        soap.header=xml
        body=""
        body << "<DIServiceInfo>"
        body << "<DomainName>"
        body << repository[:repository_domain_name]
        body << "</DomainName>"
        body << "<ServiceName>"
        body << server
        body << "</ServiceName>"
        body << "</DIServiceInfo>"
        body << "<FolderName>"
        body << workflow[:folder_name]
        body << "</FolderName>"
        body << "<WorkflowName>"
        body << workflow[:name]
        body << "</WorkflowName>"
        body << "<Reason>"
        body << "HDCM"
        body << "</Reason>"
        body << "<Parameters>"
        if variables
          variables.each do |v|
            parameter=Dip::Parameter.find(v[0].to_s)
            body << "<Parameters>"
            body << "<scope>"
            body << parameter[:scope].to_s
            body << "</scope>"
            body << "<Name>"
            body << parameter[:name].to_s
            body << "</Name>"
            body << "<Value>"
            body << (v[1].to_s.size>0 ? Dip::HeaderValue.find(v[1].to_s).code.to_s : '')
            body << "</Value>"
            body << "</Parameters>"
          end
        end
        body << "</Parameters>"
        body << "<RequestMode>NORMAL</RequestMode>"
        soap.body=body
      end
    rescue => ex
      logger.error ex
    end
    if response
      return response.to_hash[:start_workflow_ex_return][:run_id]
    end
  end

  def self.get_workflow_details_ex(repository, sessionId, workflow, server, run_id)
    begin
      url= repository.service_url+"/services/BatchServices/DataIntegration?WSDL"
      client=Savon.client(url)
      client.wsdl.endpoint=url
      response=client.request :get_workflow_details_ex do
        xml =""
        xml << "<Context>"
        xml << "<SessionId>"
        xml << sessionId
        xml << "</SessionId>"
        xml << "</Context>"
        soap.header=xml
        body=""
        body << "<DIServiceInfo>"
        body << "<DomainName>"
        body << repository[:repository_domain_name]
        body << "</DomainName>"
        body << "<ServiceName>"
        body << server
        body << "</ServiceName>"
        body << "</DIServiceInfo>"
        body << "<FolderName>"
        body << workflow[:folder_name]
        body << "</FolderName>"
        body << "<WorkflowName>"
        body << workflow[:name]
        body << "</WorkflowName>"
        body << "<WorkflowRunId>"
        body << run_id.to_s
        body << "</WorkflowRunId>"
        #<WorkflowRunInstanceName>?</WorkflowRunInstanceName>
        soap.body=body
      end
    rescue => ex
      logger.error ex
    end
    if response
      response.to_hash[:get_workflow_details_ex_return][:workflow_details][:run_error_message]
      return response.to_hash[:get_workflow_details_ex_return][:workflow_details][:workflow_run_status]
    end
  end
end
