class Recipe
	attr_accessor :id, :name, :description, :ingredients, :instructions

	def initialize(id, name, description, ingredients, instructions)
		@id = id
		@name = name
		@description = description
		@ingredients = ingredients
		@instructions = instructions
	end
end

class Bistro
	attr_reader :recipes
	def initialize
		@recipes = []
	end

	def add_recipe(recipe)
		@recipes.push(recipe)
	end

	def display_menu
		@recipes.each do |x|
			puts "#{x.id}: #{x.name}"
		end
	end

	def display_recipe
		puts "What recipe would you like to see?"
		input = gets.chomp.to_i
		recipes.each do |y|
			if y.id == input
				puts "#{y.name}\n#{y.description}\n#{y.ingredients}\n#{y.instructions}"
			end
		end
	end

	def alphabetize
		@recipes.sort_by! {|r| r.name}
		counter=1
		@recipes.each do |i|
		i.id=counter
		counter+=1
		end	
	end

 end

burger = Recipe.new(1, "Burger", "tasty", "bread", "just order one")
sandwich = Recipe.new(2, "Sandwich", "not as tasty", "multiple breads", "make one")
shawarma = Recipe.new(3, "Shawarma", "very tasty", "wrap", "travel to the middle east")
pizza = Recipe.new(4, "Pizza", "decent", "lots of cheese", "fly to italy")

bistro = Bistro.new

bistro.add_recipe(burger)
bistro.add_recipe(sandwich)
bistro.add_recipe(shawarma)
bistro.add_recipe(pizza)
bistro.alphabetize
bistro.display_menu
