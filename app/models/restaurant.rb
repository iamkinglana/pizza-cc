class Restaurant < ApplicationRecord

  has_many :restaurantpizzas, class_name: 'RestaurantPizza'
  has_many :pizzas, through: :restaurantpizzas

end
