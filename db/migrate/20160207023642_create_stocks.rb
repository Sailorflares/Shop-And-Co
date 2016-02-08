class CreateStocks < ActiveRecord::Migration
  def change
    create_table :stocks do |t|
  	  t.string :product_id
      t.integer :quantity
      t.decimal :price

      t.timestamps
    end
  end
end
