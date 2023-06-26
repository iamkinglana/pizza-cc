class RestaurantPizza < ApplicationRecord
  belongs_to :restaurant
  belongs_to :pizza

  validates :price, numericality: { only_integer: true, less_than_or_equal_to: 30 }

end
