class Sale < ActiveRecord::Base
	belongs_to :drink

	scope :on_day, lambda { |date = Date.today|
	    where("DATE(created_at) = ?", date)
	  } 

end
