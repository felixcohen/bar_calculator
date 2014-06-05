class RemoveDateFromDiscount < ActiveRecord::Migration
  def change
  	remove_column :discounts, :date
  end
end
