class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.date :date
      t.float :cost

      t.timestamps
    end
  end
end
