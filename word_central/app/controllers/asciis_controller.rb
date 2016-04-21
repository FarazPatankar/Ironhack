class AsciisController < ApplicationController
	def new
	end

	def create
		text = params[:asciis][:user_text]

		artii = Artii::Base.new :font => 'acrobatic'
		@text = artii.asciify(text)

		render 'results'
	end
end