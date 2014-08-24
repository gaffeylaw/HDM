class Dip::Diperror
  def self.log(batchId,message_en,message_zh)
	  sql=""

	  sql << "plsql.hdm_common_log.log( :p_batch_id => \'#{batchId}\',:p_message => %Q{#{message_en.to_s}},:p_locale => \'EN\')"

	  rs=eval(sql)

	  sql=""
	  sql << "plsql.hdm_common_log.log( :p_batch_id => \'#{batchId}\',:p_message => %Q{#{message_zh.to_s}},:p_locale => \'ZH\')"
	  rs=eval(sql)

	end
end
