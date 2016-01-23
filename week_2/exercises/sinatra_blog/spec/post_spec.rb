
require_relative("../lib/post.rb")
require 'date'


describe Post do
	before :each do
		@post1 = Post.new("Old post", "This post is very old", Date.new(2016, 1, 10), "Faraz", "Time")
	end

  	describe "#posts" do
    	it "returns the post's author" do
    		expect(@post1.author).to eq("Faraz")
    	end

    	it "returns the post's category" do
    	expect(@post1.category).to eq("Time")
    	end
  	end
end