class Dip::Template < ActiveRecord::Base
  set_table_name :dip_template
  has_many :template_column, :dependent => :destroy
  has_many :import_management, :dependent => :destroy
  has_many :dip_authority, :dependent => :destroy, :foreign_key => :function
  @@import_list={}

  def self.getImportList
    @@import_list
  end

  query_extend
  validates_presence_of :name, :temporary_table, :table_name, :code ,:query_view
  validates_uniqueness_of :name, :code

  def export_template(id, type)
    model_folder= File.expand_path("../../../../../../public/upload", __FILE__)
    if !File.exist? model_folder
      FileUtils.mkdir(model_folder)
    end
    if (!File.exist?(model_folder+"/epm"))
      FileUtils.mkdir(model_folder+"/epm")
    end
    if (!File.exist?(model_folder+"/epm/model"))
      FileUtils.mkdir(model_folder+"/epm/model")
    end

    if type=="xlsx"
      path=model_folder+"/epm/model/"+self[:name]+"."+type
      p = Axlsx::Package.new
      p.use_shared_strings = true
      workbook = p.workbook
      workbook.add_worksheet(:name => "data") do |sheet|
        columns=get_columns(id);
        cols=[]
        columns.each do |column|
          cols << column[:name].to_s
        end
        sheet.add_row(cols,:types=>Dip::Utils.get_type(cols))
      end
      p.serialize path
    else
      type="xls"
      path=model_folder+"/epm/model/"+self[:name]+"."+type
      workbook= Spreadsheet::Workbook.new
      sheet=workbook.create_worksheet(:name => 'data')
      columns=get_columns(id);
      columns.each do |column|
        sheet.row(0).push(column[:name].to_s)
      end
      workbook.write path
    end
    return path
  end

  def get_columns(id)
    columns=Dip::TemplateColumn.where(:template_id => id).order(:index_id)
  end

  def self.upload_file(file)
    out_file=Irm::AttachmentVersion.create({:source_id => "EPM_DATA_IMPORT_SRC",
                                            :source_type => 'Template',
                                            :data => file,
                                            :description => 'Template Data'})
    return out_file.data.path
  end
end
