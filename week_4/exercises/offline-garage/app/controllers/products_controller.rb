class ProductsController < ApplicationController
	def index
		@products = Product.all
	end

	def show
		id = params[:id]
		@product = Product.find_by(id: id)
		@bids = @product.bids.all

		if @product.deadline < Time.now
			@winner = @bids.order("amount DESC").first
			if @winner.present?
				render("products/show")
			else
				render(:text => "The deadline has expired and no bids were received.")
			end
		end
	end

	def create
		title = params[:title]
		description = params[:description]
		deadline = params[:deadline]
		minimum_bid = params[:minimum_bid]
		id = params[:id]
		user = User.find_by(id: id)
		product = user.products.create(title: title, description: description, deadline: deadline, minimum_bid: minimum_bid)

		redirect_to("/products")
	end

	def destroy
	end

	def new
		id = params[:id]
		@user = User.find_by(id: id)
	end
end
