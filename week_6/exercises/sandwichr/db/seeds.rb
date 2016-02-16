# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Sandwich.create(name: "Chicken", bread_type: "Brown")
Sandwich.create(name: "Beef", bread_type: "White")
Sandwich.create(name: "Pork", bread_type: "Black")
Sandwich.create(name: "Veggie", bread_type: "Gluten-Free")

Ingredient.create(name: "Cheese", calories: 10)
Ingredient.create(name: "Mustard", calories: 100)
Ingredient.create(name: "Ketchup", calories: 5)
Ingredient.create(name: "Tofu", calories: 25)