require 'facets'

class TextInspectionsController < ApplicationController
	def new
	end

	def create
		@text = params[:text_inspection][:user_text]
		@word_count = @text.split(" ").length

		@time_to_read = (@word_count.to_f/275).ceil

		if @time_to_read <= 1
			@time_to_read = @time_to_read.to_s + " minute"
		else
			@time_to_read = @time_to_read.to_s + " minutes"
		end

		@frequency = @text.split(" ").frequency

		@frequency = @frequency.sort_by{|key, value| -value}

		@frequency = @frequency.first(10)


		render 'results'
	end
end
