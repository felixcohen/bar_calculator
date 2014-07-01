class AddTokenToBusiness < ActiveRecord::Migration
  def change
  	 add_column :businesses, :token, :string
  end
end
