class Discount < ActiveRecord::Base
	validates :amount, presence: true
	scope :on_day, lambda { |date = Date.today|
	    where("DATE(created_at) = ?", date)
	  } 
end

