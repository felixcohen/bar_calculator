class Drink < ActiveRecord::Base
	has_many :sales
end

def total_drinks 
	drinks = Drink.all
	sum = 0
	drinks.each do |drink|
		sum = sum + (drink.sales.today.length*drink.cost) 
	end
	return sum
end
