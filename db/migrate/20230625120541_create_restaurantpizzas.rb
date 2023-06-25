class CreateRestaurantpizzas < ActiveRecord::Migration[7.0]
  def change
    create_table :restaurantpizzas do |t|
      t.integer :restaurant_id
      t.integer :pizza_id
      t.integer :price

      t.timestamps
    end
  end
end
