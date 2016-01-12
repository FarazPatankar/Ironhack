require_relative("blog.rb")

class Post
	attr_reader :title, :date, :text
	def initialize(title, date, text)
		@title = title
		@date = date
		@text = text
	end
end

class SponsoredPost < Post
	def initialize(title, date, text)
		@title = "******#{title}******"
		@date = date
		@text = text
	end
end