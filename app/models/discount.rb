class Discount < ActiveRecord::Base
	validates :amount, presence: true
	validates :business_id, presence: true

		belongs_to :business

	scope :on_day, lambda { |date = Date.today|
	    where("DATE(created_at) = ?", date)
	  } 
end

