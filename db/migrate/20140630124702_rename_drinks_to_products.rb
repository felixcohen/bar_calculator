class RenameProductsToProducts < ActiveRecord::Migration
  def change
  	rename_table :products, :products
  end
end
