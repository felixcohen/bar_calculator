class AddTabToSale < ActiveRecord::Migration
  def change
  	add_column :sales, :tab_id, :integer
  end
end
