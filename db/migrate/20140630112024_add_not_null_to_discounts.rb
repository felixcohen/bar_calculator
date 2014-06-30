class AddNotNullToDiscounts < ActiveRecord::Migration
  def change
  	  	change_column :discounts, :amount, :integer, :null => false
  end
end
