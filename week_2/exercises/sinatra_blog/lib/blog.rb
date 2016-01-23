class Blog
	attr_reader :sorted_posts, :posts_by_author, :posts_by_category
	def initialize
		@posts = []
	end

	def add_post(post)
		@posts.push(post)
	end

	def posts
		@posts
	end

	def latest_posts
		@sorted_posts = @posts.sort do |post_1, post_2|
			post_2.date <=> post_1.date
		end
		@sorted_posts
	end

	def posts_by_author(author)
		@posts_by_author = []
		@posts.each do |post|
			if author.downcase == post.author.downcase
				@posts_by_author << post
			end
		end
		@posts_by_author
	end

	def posts_by_category(category)
		@posts_by_category = []
		@posts.each do |post|
			if category.downcase == post.category.downcase
				@posts_by_category << post
			end
		end
		@posts_by_category
	end
end