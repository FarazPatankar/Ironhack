require "sinatra"
require "sinatra/reloader" if development?
require "imdb"
require_relative("lib/movies.rb")

movies = Movies.new


get "/" do
	erb(:search)
end

post "/results" do
	@search_string = params[:search]
	movies.limit_to_twenty(@search_string)

	@list = movies.get_movies_with_posters
	@list_length = movies.get_movies_with_posters.length

	@random_movie = movies.get_random_release_date
	@release_date = @random_movie.year
  	erb(:results)
end

post "/correct" do
	erb(:correct)
end

post "/wrong" do
	erb(:wrong)
end