# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# db/seeds.rb

# Create Users
User.create!(name: 'John Doe', email: 'john@example.com', password: 'password')
User.create!(name: 'Jane Smith', email: 'jane@example.com', password: 'password')

# Create Recipes
Recipe.create!(name: 'Chocolate Cake', prescription_time: Time.now, cooking_time: 60, description: 'Delicious chocolate cake recipe.', public: true, user_id: 1)
Recipe.create!(name: 'Vegetable Stir-Fry', prescription_time: Time.now, cooking_time: 30, description: 'Healthy vegetable stir-fry recipe.', public: true, user_id: 2)

# Create Food
Food.create!(name: 'Food one', measurement_unit: 'grams', price: 20.5, quantity: 30, user_id: 1)
Food.create!(name: 'Food two', measurement_unit: 'grams', price: 30.5, quantity: 25, user_id: 1)
