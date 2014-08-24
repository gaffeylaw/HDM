module NotInsertNil
  def self.included(base)
    base.class_eval do
      #def write_attribute(attr_name, value)
      #  p '-------------------'
      #  p value
      #  unless value.nil?
      #    attr_name = attr_name.to_s
      #    attr_name = self.class.primary_key if attr_name == 'id'
      #    @attributes_cache.delete(attr_name)
      #    if (column = column_for_attribute(attr_name)) && column.number?
      #      @attributes[attr_name] = convert_number_column_value(value)
      #    else
      #      @attributes[attr_name] = value
      #    end
      #  end
      #end
      def arel_attributes_values(include_primary_key = true, include_readonly_attributes = true, attribute_names = @attributes.keys)
        attrs = {}
        klass = self.class
        arel_table = klass.arel_table
        attribute_names.each do |name|
          if (column = column_for_attribute(name)) && (include_primary_key || !column.primary)

            if include_readonly_attributes || (!include_readonly_attributes && !self.class.readonly_attributes.include?(name))

              value = if coder = klass.serialized_attributes[name]
                        coder.dump @attributes[name]
                      else
                        # FIXME: we need @attributes to be used consistently.
                        # If the values stored in @attributes were already type
                        # casted, this code could be simplified
                        read_attribute(name)
                      end
              if new_record?
                unless value.nil?
                  attrs[arel_table[name]] = value
                end
              else
                attrs[arel_table[name]] = value
              end
            end
          end
        end
        attrs
      end
    end
  end
end