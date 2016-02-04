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
		id = params[:id]
		user = User.find_by(id: id)
		product = user.products.create(title: title, description: description, deadline: deadline)

		redirect_to("/products")
	end

	def destroy
	end

	def new
		id = params[:id]
		@user = User.find_by(id: id)
	end
end
