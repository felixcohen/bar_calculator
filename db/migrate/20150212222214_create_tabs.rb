class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :name, :null => false
      t.string :status, :null => false, :default => "open"
      t.boolean :paid, :null => false, :default => false
      t.timestamps
    end
  end
end
