class Chart
	def initialize
		@movies = []
		@chart = ""
		@numbers = ""
		@separator = "-"
	end

	def add_movie(movie)
		@movies.push(movie)
	end

	def create_chart
		10.downto(1) do |rating|
			@movies.each do |movie|
				if movie.rating >= rating
					@chart += "|$"
				else
					@chart += "| "
				end
			end
			@chart += "|\n"
		end
		@chart
	end

	def create_numbers
		@movies.each do |movie|
			@numbers += "|#{movie.number}"
		end
		@numbers += "|"
		@numbers
	end

	def display_movies
		@movies.each do |movie|
			puts "#{movie.number} #{movie.name}"
		end
	end

	def create_separator
		@movies.each do |movie|
			@separator += "--"
		end
	end

	def publish
		create_chart
		puts @chart
		create_separator
		puts @separator
		create_numbers
		puts @numbers
		display_movies
	end	
end