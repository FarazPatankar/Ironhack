# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

apple = Product.create(title: "Apple", description: "Iz red", deadline: DateTime.new(2015, 2, 20), minimum_bid: 5)

mat = User.create(name: "Mat", email: "mat@mat.com", password: "swordfish", password_confirmation: "swordfish")