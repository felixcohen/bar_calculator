class Sale < ActiveRecord::Base
	validates :product_id, presence: true
	belongs_to :product

	scope :on_day, lambda { |date = Date.today|
	    where("DATE(created_at) = ?", date)
	  } 

end
