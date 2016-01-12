require_relative("lib/blog.rb")
require_relative("lib/post.rb")

require 'date'
require 'colorize'

joshs_post = Post.new("Donuts", Date.new(2016,1,11) , "I don't like donuts")
nizars_post = Post.new("Star Wars", Date.new(2016,1,9) , "I love Star Wars")
karins_post = SponsoredPost.new("Dunkin' Donuts", Date.new(2016,1,10), "Buy our donuts")
alias_post = Post.new("Harry Potter", Date.new(2016,1,12), "I wish I was a HP character")
farazs_post = Post.new("Lord of the Rings", Date.new(2016,1,13), "My precious")


ironhack_blog = Blog.new
ironhack_blog.add_post(joshs_post)
ironhack_blog.add_post(nizars_post)
ironhack_blog.add_post(karins_post)
ironhack_blog.add_post(alias_post)
ironhack_blog.add_post(farazs_post)

ironhack_blog.publish_front_page