# _plugins/date_to_string_tw.rb
require 'liquid'
require 'date'
require 'time'

module DateToStringTw
  def date_to_string_tw(datetime)
    if datetime.is_a?(String)
      return DateTime.parse(datetime).strftime("%Y年%m月%d日 %H:%M:%S") + " UTC+8"
    end
    if datetime.is_a?(Time)
      return datetime.strftime("%Y年%m月%d日 %H:%M:%S") + " UTC+8"
    end
    return "--"
  end
end
  
Liquid::Template.register_filter(DateToStringTw)