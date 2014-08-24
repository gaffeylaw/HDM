module Irm::QueryExtend
# 这个模块用来扩展ActiveRecord::Base,使用之自动新增scope active query,实例方法active?
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
        def query_extend(options = {})
          return if self.included_modules.include?(::Irm::QueryExtend::InstanceMethods)
          send :include, ::Irm::QueryExtend::InstanceMethods
          default_options = {:opu_filter=>false}
          query_options =  default_options.merge(options)

          class_eval do

            scope :enabled,where("#{table_name}.status_code = ?",Irm::Constant::ENABLED)
            scope :disabled,where("#{table_name}.status_code = 'OFFLINE'")

            scope :query ,lambda{|id|
              where("#{table_name}.id = ?",id)
            }

            scope :query_by_ids ,lambda{|ids|
              if ids.length<1
                ids = ids+[""]
              end
              where("#{table_name}.id IN (?)",ids)
            }


            scope :select_all,lambda{
              select("#{table_name}.*")
            }

            scope :query_by_status_code,lambda{|status_code|
              where("#{table_name}.status_code = ?",status_code)
            }
            #动态构建语言查询,传入的column为当前表+字段名
            scope :match_value, lambda { |column, value|
              return {} if value.blank?
              { :conditions => ["#{column} like ?", "%#{value}%"] }
            }
            
            #动态构建语言查询,传入的column为当前表+字段名
            scope :equal_value, lambda { |column, value|
            return {} if value.blank?
              { :conditions => ["#{column} = ?", "#{value}"] }
            }
            #动态构建语言查询,传入的column为当前表+字段名
            scope :date_between_value, lambda { |column, value1,value2|
              return {} if (value1.blank?||value2.blank?)
              value2 = value2.to_date.advance(:days=>1).strftime("%Y-%m-%d") if value2.present?
              where(column.to_sym=>value1..value2)
            }
            #排序构建
            scope :column_order, lambda { |key_part1,key_part2|
              { :order => key_part1.to_s+" "+ key_part2.to_s
              }
            }


            scope :default_filter ,lambda{
              current_opu
            }

            def self.current_opu(from_table_name = table_name)
              current_operation_unit = Irm::OperationUnit.current
              if current_operation_unit
                where("#{from_table_name}.opu_id = ?",current_operation_unit.id)
              else
                where({})
              end
            end

            def self.by_opu(opu_id_or_ids=nil,from_table_name = table_name)
              opu_ids = []

              if opu_id_or_ids
                if opu_id_or_ids.is_a?(Array)
                  opu_ids =  opu_id_or_ids
                elsif opu_id_or_ids.is_a?(String)
                  opu_ids = [opu_id_or_ids]
                end
              else
                current_operation_unit = Irm::OperationUnit.current
                opu_ids = [current_operation_unit.id] if current_operation_unit
              end

              if opu_ids.any?
                if opu_ids.length==1
                  return where("#{from_table_name}.opu_id = ?",opu_ids.first)
                else
                  return where("#{from_table_name}.opu_id IN (?)",opu_ids)
                end
              else
                return {}
              end

            end

            def wrap_name
              self[:name]
            end

          end
        end
    end

    module InstanceMethods
      def self.included(base)
        base.extend ClassMethods
      end


      def enabled?
        if(self.respond_to?(:status_code))
          ::Irm::Constant::ENABLED.eql?(self.send(:status_code))
        else
          true
        end
      end

      def to_liquid
        attributes.stringify_keys  
      end

      module ClassMethods
        def query_by_id(id)
          super(id) rescue nil
        end

         #将不符合当前model中的属性删除
        def crop(options)
          return {} unless options.is_a?(Hash)
          options.keys.each do |key|
            options.delete(key) unless self.new.respond_to?(key.to_sym)
          end
          options
        end

        def status_meaning(status_lookup = "status_lookup",current_table="#{table_name}", column_name="")
          joins("JOIN irm_lookup_values_vl #{status_lookup} on #{status_lookup}.lookup_code = #{current_table}.status_code AND #{status_lookup}.language = '#{I18n.locale}'").
          where("#{status_lookup}.lookup_type='SYSTEM_STATUS_CODE'").
          select("#{status_lookup}.meaning #{(column_name + "_" ) unless column_name.blank?}status_meaning")
        end

        def order_display(current_table="#{table_name}")
          order("#{current_table}.display_sequence")
        end
        def order_id(current_table="#{table_name}")
          order("#{current_table}.id DESC")
        end
      end
    end
end