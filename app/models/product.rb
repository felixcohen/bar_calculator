class Product < ActiveRecord::Base

	validates :name, presence: true
	validates :cost, presence: true
	validates :business_id, presence: true

	has_many :sales, dependent: :destroy
	belongs_to :business

	scope :current, lambda { 
    where("date >= ? and date <= ?", 
           (Date.today - 10.days), Date.today.end_of_day.utc)
	} 
end

def total_products(date=Date.today)
	products = Product.all
	sum = 0
	products.each do |product|
		sum = sum + (product.sales.on_day(date).length*product.cost) 
	end
	return sum
end

def total_discount(date=Date.today) 
	discount = Discount.on_day(date)
	sum = 0
	discount.each do |discount|
		unless discount.amount.nil? 
			sum = sum + (discount.amount) 
		end
	end
	return sum
end