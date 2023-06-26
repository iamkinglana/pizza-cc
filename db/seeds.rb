# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# Create fake restaurants
5.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address
  )
end

# Create fake pizzas
5.times do
  Pizza.create(
    name: Faker::Food.dish,
    ingredients: Faker::Food.description
  )
end

# Create fake restaurant pizzas
Restaurant.all.each do |restaurant|
  rand(1..3).times do
    pizza = Pizza.all.sample
    RestaurantPizza.create(
      restaurant_id: restaurant.id,
      pizza_id: pizza.id,
      price: Faker::Number.decimal(l_digits: 2)
    )
  end
end
