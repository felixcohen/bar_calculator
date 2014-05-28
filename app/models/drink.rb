class Drink < ActiveRecord::Base
	has_many :sales

	scope :current, lambda { 
    where("date >= ? and date <= ?", 
           (Date.today - 4.days), Date.today.end_of_day.utc)
	} 
end

def total_drinks 
	drinks = Drink.all
	sum = 0
	drinks.each do |drink|
		sum = sum + (drink.sales.today.length*drink.cost) 
	end
	return sum
end

def total_discount 
	discount = Discount.all
	sum = 0
	discount.each do |discount|
		sum = sum + (discount.amount) 
	end
	return sum
end