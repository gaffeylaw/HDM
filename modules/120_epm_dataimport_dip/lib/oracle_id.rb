module OracleId
  def self.included(base)
    base.class_eval do
      def create_sequence_and_trigger(table_name, options)
        if table_name.downcase().eql?("irm_object_codes") || table_name.downcase().eql?("irm_machine_codes")
          seq_name = options[:sequence_name] || default_sequence_name(table_name)
          seq_start_value = options[:sequence_start_value] || default_sequence_start_value
          execute "CREATE SEQUENCE #{quote_table_name(seq_name)} START WITH #{seq_start_value}"
          create_primary_key_trigger(table_name, options) if options[:primary_key_trigger]
        else
        end
      end

      public
      def auto_increment(table_name, options)
        seq_name = options[:sequence_name] || default_sequence_name(table_name)
        seq_start_value = options[:sequence_start_value] || default_sequence_start_value
        execute "CREATE SEQUENCE #{quote_table_name(seq_name)} START WITH #{seq_start_value}"

        create_primary_key_trigger(table_name, options) if options[:primary_key_trigger]
      end
    end
  end
end
