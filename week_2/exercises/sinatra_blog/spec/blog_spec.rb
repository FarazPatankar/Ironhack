require_relative("../lib/blog.rb")
require_relative("../lib/post.rb")
require 'date'


describe Blog do
	before :each do
		@blog = Blog.new
		@post1 = Post.new("Old post", "This post is very old", Date.new(2016, 1, 10))
		@post2 = Post.new("New post", "This is the latest post", Date.new(2016, 1, 20))
	end

  	describe "#posts" do
    	it "returns the posts array" do
    		expect(@blog.posts).to eq([])
    	end
  	end

  	describe "#latest_posts" do
  		it "returns the posts array sorted by latest posts" do
			@blog.add_post(@post1)
			@blog.add_post(@post2)
			expect(@blog.latest_posts).to eq([@post2, @post1])
		end
	end
end