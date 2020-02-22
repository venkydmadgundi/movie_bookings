class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  def get_show_time(show_hour)
  	case show_hour
		when 0..11 then "Morning"
		when 12..15 then "Afternoon"
		when 16..20 then "Evening"
		when 21..23 then "Night"
	end
  end
end
