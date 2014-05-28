class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.string :name
      t.date :date
      t.float :cost

      t.timestamps
    end
  end
end
