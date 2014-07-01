class AddBusinessToDiscount < ActiveRecord::Migration
  def change
  	 add_column :discounts, :business_id, :integer
  end
end
