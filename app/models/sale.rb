class Sale < ActiveRecord::Base
	validates :product_id, presence: true
	belongs_to :product
	belongs_to :tab

	scope :on_day, lambda { |date = Date.today|
	    where("DATE(created_at) = ?", date)
	  } 
 
end
