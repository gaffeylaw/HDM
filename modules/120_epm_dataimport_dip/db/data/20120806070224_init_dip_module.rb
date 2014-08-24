# -*- coding: utf-8 -*-
class InitDipModule < ActiveRecord::Migration
  def up
    com_product = Irm::ProductModule.new({:product_short_name => "DIP", :installed_flag => "Y", :not_auto_mult => true})
    com_product.product_modules_tls.build({:name => "EPM DATA IMPORT", :description => "EPM DATA IMPORT", :language => "en", :source_lang => "en"})
    com_product.product_modules_tls.build({:name => "EMP 数据导入", :description => "EMP 数据导入", :language => "zh", :source_lang => "en"})
    com_product.save
  end

  def down
  end
end
