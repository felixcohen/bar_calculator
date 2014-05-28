class Sale < ActiveRecord::Base
	belongs_to :drink

	scope :today, lambda { 
    where("created_at >= ? and created_at <= ?", 
           Date.today.beginning_of_day.utc, Date.today.end_of_day.utc)
	  }  
end
