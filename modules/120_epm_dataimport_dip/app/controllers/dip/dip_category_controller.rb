class Dip::DipCategoryController < ApplicationController
  layout "bootstrap_application_full"

  def get_tree_data
    tree_nodes = []
    categories = Dip::DipCategory.where(:category_type => params[:category_type], :parent => nil).order("name")
    categories.each do |tr|
      tree_node=get_child_notes(tr)
      tree_nodes << tree_node
    end
    tree_node = {:id => 'unclassified', :name => t(:label_unclassified), :text => t(:label_unclassified),:hasChildren=>false ,:children => []}
    tree_nodes << tree_node
    result = [{:id => nil, :name => t(:all), :text => t(:all), :children => tree_nodes, :checked => true, :expanded => true}]
    respond_to do |format|
      format.json { render :json => result.to_json }
    end
  end

  def get_child_notes(category)
    children=[]
    Dip::DipCategory.where(:parent => category.id).order("name").each do |c|
      children << get_child_notes(c)
    end
    {:id => category.id, :name => category.name, :text => category[:name], :children =>children, :checked => false, :expanded => false}
  end
  #---------------
  def get_type_tree_data
    tree_nodes = []
    [Dip::DipConstant::CATEGORY_TEMPLATE, Dip::DipConstant::CATEGORY_REPORT, Dip::DipConstant::CATEGORY_ODI, Dip::DipConstant::CATEGORY_INFA].each do |tr|
      tree_node = {:text => t("label_#{tr.downcase}_category"), :category_type => tr, :checked => false, :expanded => false, :hasChildren => false}
      tree_node[:children]=get_child_type(nil, t("label_#{tr.downcase}_category"), tr)
      tree_nodes << tree_node
    end
    respond_to do |format|
      format.json { render :json => tree_nodes.to_json }
    end
  end
  #---------------
  def get_child_type(parentId, parentName, categoryType)
    children=[]
    Dip::DipCategory.where({:category_type => categoryType, :parent => parentId}).each do |c|
      tree_node = {:id => c.id, :text => c.name, :category_type => categoryType, :parent_name => parentName, :checked => false, :expanded => false, :hasChildren => false}
      tree_node[:children]=get_child_type(c.id, c.name, categoryType)
      children << tree_node
    end
    children
  end
  #---------------
  def index
    respond_to do |format|
      format.html
    end
  end

  def get_data
    category_type= Dip::DipConstant::CATEGORY_TEMPLATE
    if params[:category_type]== Dip::DipConstant::CATEGORY_REPORT
      category_type= Dip::DipConstant::CATEGORY_REPORT
    end
    categories=Dip::DipCategory.where(:category_type => category_type).order(:name)
    data, count=paginate(categories)
    respond_to do |format|
      format.html {
        @datas = data
        @count = count
      }
    end
  end
  #---------------
  def update
    begin
      result ={:success => true}
      cate=Dip::DipCategory.find(params[:id])
      if  cate.update_attributes({:name => params[:name]})
        cate.errors.add("success_msg_only", t(:label_operation_success))
      else
        result[:success]=false
      end
      result[:msg]=Dip::Utils.error_message_for cate
    rescue => ex
      result[:success]=false
      cate.errors.add("success_msg_only", ex)
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end
  #---------------
  def destroy
    result={:success => true}
    begin
      category_id=params[:category_id]
      deleteCategory(category_id)
      result[:msg]=[t(:label_operation_success)]
    rescue =>ex
      result[:success]=false
      result[:msg]=[ex.to_s]
    end
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end
  #---------------
  def deleteCategory(id)
    category=Dip::DipCategory.find(id)
    Dip::DipCategory.where(:parent => id).each do |c|
      deleteCategory(c.id);
    end
    if category
      category.destroy
    end
  end
  #---------------
  def create
    result={:success => true}
    category=Dip::DipCategory.new({:name => params[:name], :category_type => params[:category_type], :parent => params[:parent]})
    if category.save
      category.errors.add("success_msg_only", t(:label_operation_success))
    else
      result[:success]=false
    end
    result[:msg]=Dip::Utils.error_message_for category
    respond_to do |format|
      format.json {
        render :json => result.to_json
      }
    end
  end

  def get_category_list
    list=Dip::DipCategory.where(:category_type => params[:type]).order("name").collect { |v| [Dip::DipCategory.get_full_path(v), v.id] }
    if list.size >0
      list=[["", ""]]+list
    else
      list=[["", ""]]
    end
    respond_to do |format|
      format.json { render :json => list.to_json }
    end
  end
end
