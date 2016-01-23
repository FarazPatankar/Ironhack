class Post
	attr_reader :title, :text, :date, :author, :category
	def initialize(title, text, date, author, category)
		@title = title
		@text = text
		@date = date
		@author = author
		@category = category
	end

	def author
		@author
	end

	def category
		@category
	end
end