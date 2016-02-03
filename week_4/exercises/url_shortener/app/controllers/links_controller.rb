class LinksController < ApplicationController
	def index
		@links = Link.all
	end

	def shortlink
		@link = params[:link]
		@shortlink = [*("a".."z"),*("A".."Z")].sample(3).join

		url = Link.find_by(link: @link)

		if url
			redirect_to("/")
		else
			Link.create(link: @link, shortlink: @shortlink, count: 0)
			redirect_to("/")
		end
	end

	def redirect
		shortlink = params[:shortlink]
		website_object = Link.find_by(shortlink: shortlink)

		website_object.count = website_object.count + 1
		website_object.save

		website = website_object.link
		proper_website = Link.check_url(website)
		redirect_to("#{proper_website}")
	end

	def most_visited_pages
		@links = Link.order("count DESC").limit(10)
	end

	def url_list
		@links = Link.all
	end
end
