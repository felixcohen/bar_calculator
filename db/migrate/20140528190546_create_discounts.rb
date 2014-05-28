class CreateDiscounts < ActiveRecord::Migration
  def change
    create_table :discounts do |t|
      t.date :date
      t.float :amount

      t.timestamps
    end
  end
end
