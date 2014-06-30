class AddNotNullToProducts < ActiveRecord::Migration
  def change
  	change_column :products, :cost, :integer, :null => false
  end
end
