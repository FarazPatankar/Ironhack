class SandwichViewsController < ApplicationController
	protect_from_forgery with: :exception

	def home
	end

	def index
		@sandwiches = Sandwich.all
	end

	def show
		authenticate_user!
		id = params[:id]
		@sandwich = Sandwich.find_by(id: id)
		@ingredients = Ingredient.all
	end
end
