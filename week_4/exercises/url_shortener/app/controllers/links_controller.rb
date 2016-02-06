require 'uri'

class LinksController < ApplicationController
	def index
		@links = Link.all
	end

	def shortlink
		# Check if link is valid
		# Create shortlink after checking
		# Check if already exists otherwise create
		@link = params[:link]
		@link = Link.check_url(@link)

		if @link =~ /\A#{URI::regexp}\z/
			@shortlink = [*("a".."z"),*("A".."Z")].sample(3).join
			url = Link.find_by(link: @link)

			if url
				redirect_to("/")
			else
				Link.create(link: @link, shortlink: @shortlink, count: 0)
				redirect_to("/")
			end
		else
			render(:text => "Please enter a valid uri")
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
