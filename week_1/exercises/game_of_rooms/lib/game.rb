class Game
	attr_reader :rooms, :current_room, :inventory
	def initialize
		@rooms = []
		@current_room = 0
		@inventory = []
	end

	def add_room(room)
		@rooms.push(room)
	end

	def pick_up
		if @inventory.length < 1
			@inventory.push(@rooms[@current_room].item)
			puts "You picked up the #{@rooms[@current_room].item}"
		else
			"Please drop your current item before picking up this item."
		end
	end

	def drop
		if @inventory.length > 0
			dropped_item = @inventory.pop
			puts "Your dropped the #{dropped_item}"
		else
			puts "There is nothing in your inventory"
		end
	end

	def begin_game
		puts "Would you like to play? yes/no?"
		user_input = gets.chomp
		if user_input.downcase == "yes"
			@rooms[@current_room].welcome
			play
		else
			puts "Goodbye"
		end
	end

	def play
		user_input = gets.chomp
		while user_input != "exit"
			if @current_room < @rooms.length-1
				if user_input.upcase == "P"
					pick_up
					play
				elsif user_input.upcase == "D"
					drop
					play
				else
					if user_input.upcase == "L"
						@rooms[@current_room].look_for_food
						play
					else
						if @rooms[@current_room].exit == (user_input.upcase)
							@current_room += 1
							@rooms[@current_room].welcome
							play
						elsif @rooms[@current_room].exit == nil
							puts "You cannot move in that direction. Please move in another direction."
							play
						elsif @rooms[@current_room].entrance == (user_input.upcase)
							@current_room -= 1
							@rooms[@current_room].welcome
							play
						else
							puts "You cannot move in that direction. Please move in another direction."
							play
						end
					end
				end
			else
				puts "You have reached the end of the game."
			end
		end
		puts "Goodbye"
	end
end