require_relative("../lib/movies.rb")
require "imdb"

describe Movies do
	before :each do
		@movies = Movies.new
		@movies.limit_to_twenty("pizza")
	end

  	describe "#limit_to_twenty" do
    	it "returns the length of the results array" do
    		expect(@movies.results.length).to eq(20)
    	end
  	end

  	describe "#get_movies_with_posters" do
  		it "gets 9 movies with posters" do
  			hello = @movies.get_movies_with_posters
  			expect(hello.length).to eq(9)
		end
	end
end