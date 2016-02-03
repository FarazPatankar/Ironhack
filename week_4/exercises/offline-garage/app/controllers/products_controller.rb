class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
	end

	def create
		title = params[:title]
		description = params[:description]
		deadline = params[:deadline]

		product = Product.create(title: title, description: description, deadline: deadline)

		redirect_to("/products")
	end

	def destroy
	end

	def new
	end
end
