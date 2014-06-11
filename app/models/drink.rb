class Drink < ActiveRecord::Base
	has_many :sales, dependent: :destroy

	scope :current, lambda { 
    where("date >= ? and date <= ?", 
           (Date.today - 10.days), Date.today.end_of_day.utc)
	} 
end

def total_drinks(date=Date.today)
	drinks = Drink.all
	sum = 0
	drinks.each do |drink|
		sum = sum + (drink.sales.on_day(date).length*drink.cost) 
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