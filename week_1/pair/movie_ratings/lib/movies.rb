class Movie
	attr_reader :name, :rating, :number
	def initialize(name, rating, number)
		@name = name
		@rating = rating
		@number = number
	end
end