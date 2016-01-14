class DarkRoom
	attr_reader :available_directions
	def initialize
		@available_directions = ["S"]
	end

	def welcome
		puts "You're in a dark room, it is probably very dark in here."
		puts "If you want to move to the Dungeon, please type 'S'"
		puts ">"
	end
end

class Forest
	attr_reader :available_directions
	def initialize
		@available_directions = ["W"]
	end

	def welcome
		puts "You're in a forest, we have many dangerous animals here, please tread lightly."
		puts "If you want to move to the Dungeon, please type 'W'"
		puts ">"
	end
end

class Beach
	attr_reader :available_directions
	def initialize
		@available_directions = "E"
	end

	def welcome
		puts "You're on a beach, beware of sharks"
		puts "If you want to move to the Dungeon, please type 'E'"
		puts ">"
	end
end

class Dungeon
	attr_reader :available_directions
	def initialize
		@available_directions = ["S"]
	end

	def welcome
		puts "Welcome to the Dungeon. Surprisingly, there are no monsters here."
		puts "If you want to move to the Airport, please type 'S'"
		puts ">"
	end
end

class Airport
	attr_reader :available_directions
	def initialize
		@available_directions = ["N"]
	end

	def welcome
		puts "Wecome to the Airport. This is where you can leave my game. You don't really want to, do you?"
		puts "You have reached the end of the game, please type 'N' to exit."
		puts ">"
	end
end