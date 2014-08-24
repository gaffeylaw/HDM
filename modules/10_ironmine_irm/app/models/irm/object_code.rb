class Irm::ObjectCode < ActiveRecord::Base
  set_table_name :irm_object_codes
  query_extend
  validates_presence_of :object_table_name
  validates_presence_of :object_code ,:if=>Proc.new{|i| !i.new_record?}
  validates_uniqueness_of :object_table_name,:scope=>[:opu_id],:if=>Proc.new{|i| i.object_table_name.present?}
  validates_uniqueness_of :object_code,:scope=>[:opu_id],:if=>Proc.new{|i| i.object_code.present?}

  after_create :generate_code

  def generate_code
    unless self.object_code.present?
      self.object_code = Fwk::IdGenerator.instance.rjust_decimal_to_62(self.id,4)
      self.save
    end
  end
  private :generate_code

  def self.code(table_name)
    instance = self.where(:object_table_name=>table_name).first
    if(instance)
      return instance.object_code
    else
      if Irm::Person.table_name.eql?(table_name)
        self.create(:object_table_name=>table_name,:created_by=>"0",:updated_by=>"0",:opu_id=>"0")
      else
        self.create(:object_table_name=>table_name)
      end
      return self.code(table_name)
    end
  end
end
