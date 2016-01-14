class Game
	attr_reader :rooms, :current_room
	def initialize
		@rooms = []
		@current_room = 0
	end

	def add_room(room)
		@rooms.push(room)
	end

	def begin_game
		puts "Would you like to play? yes/no?"
		user_input = gets.chomp
		if user_input.downcase == "yes"
			@rooms[@current_room].welcome
			puts "Enter 'exit' at any time to leave the game."
		else
			puts "Goodbye"
		end
		play
	end

	def play
		user_input = gets.chomp
		if @current_room < @rooms.length-1
			if @rooms[@current_room].available_directions.include?(user_input.upcase)
				@current_room += 1
				@rooms[@current_room].welcome
				play
			else
				puts "You cannot move in that direction."
				play
			end
		else
			puts "You have reached the end of the game."
		end
	end
end