module Fwk::ArrayToJson
  include ActionView::Helpers::JavaScriptHelper
  include ActionView::Helpers::DateHelper

  def to_grid_json(attributes,total,options={})
    json = %Q({"numRows":"#{total}")
    if total > 0
      json << %Q(,"items":[)
      each do |elem|
        eid = elem.id if elem.respond_to?("id")
        eid ||= elem[:id]
        eid ||= elem["id"]
        json << %Q({"id":"#{eid}",)
        couples = elem.attributes.symbolize_keys
        attributes.each do |atr|
          value = get_atr_value(elem, atr, couples)
          value = escape_javascript(value) if value and value.is_a? String
          if(value.is_a? Time)
            if options[:date_to_distance]&&(options[:date_to_distance].is_a? Array)&&options[:date_to_distance].include?(atr)
              value = I18n.t(:ago,:message=>distance_of_time_in_words(Time.now, value))
            else
              value = value.strftime('%Y-%m-%d %H:%M:%S')
            end
          end
          value.is_a?(Array) ? json<<%Q("#{atr}":#{value.to_json},) : json << %Q("#{atr}":"#{value}",)
        end
        json.chop! << "},"
      end
      json.chop! << "]}"
    else
      json << "}"
    end
  end

  private
  def get_atr_value(elem, atr, couples)
    if atr.to_s.include?('.')
      value = get_nested_atr_value(elem, atr.to_s.split('.').reverse)
    else
      value = couples[atr]
      value = elem.send(atr.to_sym) if value.blank? && elem.respond_to?(atr) # Required for virtual attributes
      if value.acts_like?(:BigDecimal)
        value = value.to_i
      end
    end
    value
  end

  def get_nested_atr_value(elem, hierarchy)
    return nil if hierarchy.size == 0
    atr = hierarchy.pop
    raise ArgumentError, "#{atr} doesn't exist on #{elem.inspect}" unless elem.respond_to?(atr)
    nested_elem = elem.send(atr)
    return "" if nested_elem.nil?
    value = get_nested_atr_value(nested_elem, hierarchy)
    value.nil? ? nested_elem : value
  end
end
