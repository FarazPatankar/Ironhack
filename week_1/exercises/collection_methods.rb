class Home
  attr_reader(:name, :city, :capacity, :price)

  def initialize(name, city, capacity, price)
    @name = name
    @city = city
    @capacity = capacity
    @price = price
  end
end

homes = [
  Home.new("Nizar's place", "San Juan", 2, 42),
  Home.new("Fernando's place", "Seville", 5, 47),
  Home.new("Josh's place", "Pittsburgh", 3, 41),
  Home.new("Gonzalo's place", "Málaga", 2, 45),
  Home.new("Ariel's place", "San Juan", 4, 49),
  Home.new("Karin's place", "Miami", 2, 55),
  Home.new("Alia's place", "NYC", 5, 57),
  Home.new("Faraz's place", "Mumbai", 3, 50),
  Home.new("Rooney's place", "Manchester", 2, 48),
  Home.new("Shaw's place", "London", 4, 59)
]

def array_printer(array)
	  	array.each do | home |
	    puts "Name: #{home.name} |  City: #{home.city} |  Capacity: #{home.capacity} |  Price: #{home.price}"
	  	end
end

def sorting_homes(array)
	puts "Welcome to textbnb, what would you like to sort your homes by?"
	puts "1: Sort by price : Low to High\n2: Sort by price : High to Low\n3: Sort by capacity"
	input = gets.chomp.to_i

	if input == 1
		low_to_high = array.sort_by do |home|
			home.price
		end
		array_printer(low_to_high)
	elsif input == 2
		high_to_low = array.sort_by do |home|
			-home.price
		end
		array_printer(high_to_low)
	elsif input == 3
		capacity_sort = array.sort_by do |home|
			home.capacity
		end
		array_printer(capacity_sort)
	end			
end

def city_search(array)
	puts "What City would you like to search in?"
	city = gets.chomp.downcase
	correct_city = array.select do |home|
		home.city.downcase == city
	end
	if correct_city.length == 0
		puts "Sorry, we have no results for your city."
	else
		array_printer(correct_city)
	end
end

def average_price(array)

	total_price_of_homes = array.reduce(0) do |total , home|
		total+=home.price
	end
	average_price_of_homes = total_price_of_homes/array.length
	puts average_price_of_homes
end

def enter_price(array)
	puts "What price are you looking at?"
	price = gets.chomp.to_i
	correct_price = array.find do |home|
		home.price == price
	end
	if correct_price == nil
		puts "Sorry"
	else
	    puts "Name: #{correct_price.name} |  City: #{correct_price.city} |  Capacity: #{correct_price.capacity} |  Price: #{correct_price.price}"
	end
end


#User Interface
puts "Welcome to textbnb, what would you like to do today?"
user_answer = "yes"
counter = 0
while user_answer == "yes"
		puts "1: View all available homes\n2: Sort homes by price or capacity\n3: View homes in your City\n4: View the average price of homes on our website\n5: Look for homes at a specific price"
		user_input = gets.chomp
		if user_input.to_i == 1
			array_printer(homes)
		elsif user_input.to_i == 2
			sorting_homes(homes)
		elsif user_input.to_i == 3
			city_search(homes)
		elsif user_input.to_i == 4
			average_price(homes)
		elsif user_input.to_i == 5
			enter_price(homes)
		elsif user_input == "exit"
			abort
		else
			counter += 1
			if counter >= 3
				puts "Too many wrong inputs, please login again."
				break
			end
			puts "Please enter a valid input. You will have to run the program again."
		end
	puts "Would you like to continue browsing? Please enter either yes or no."
	user_answer = gets.chomp
end
puts "Goodbye."