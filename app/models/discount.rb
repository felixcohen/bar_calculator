class Discount < ActiveRecord::Base

	scope :on_day, lambda { |date = Date.today|
	    where("DATE(created_at) = ?", date)
	  } 
end

