require "imdb"

class Movies
	attr_reader :results, :movies_with_posters
	def limit_to_twenty(string)
		search = Imdb::Search.new(string)
		@results = search.movies.take(25)
	end

	def get_movies_with_posters
		@movies_with_posters = []
		@results.each do |result|
			if result.poster != nil && result.year != nil
				@movies_with_posters << result
			end
		end

		while @movies_with_posters.size > 9
			@movies_with_posters.pop()
		end
		@movies_with_posters
	end

	def get_random_release_date
		@random_movie = @movies_with_posters.sample
		@random_movie
	end
end