class AddNotNulls < ActiveRecord::Migration
  def change
  	  	change_column :products, :cost, :integer, :null => false
  	  	change_column :products, :name, :string, :null => false
  	  	change_column :sales, :product_id, :integer, :null => false
  	  	change_column :discounts, :amount, :integer, :null => false
  	  	change_column :businesses, :name, :string, :null => false

  end
end
