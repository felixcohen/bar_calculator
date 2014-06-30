class ChangeSalestoProductIDs < ActiveRecord::Migration
  def change
  	rename_column :sales, :drink_id, :product_id
  end
end
