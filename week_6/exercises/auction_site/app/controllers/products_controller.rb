class ProductsController < ApplicationController
	def home
	end

	def new
		@user = User.find_by(id: params[:user_id])
		@product = @user.products.new
	end

	def create
		@user = User.find_by(id: params[:user_id])
		@user.products.create(product_params)
		redirect_to products_path
	end

	def index
		if params[:user_id]
			@user = User.find_by(id: params[:user_id])
			@products = @user.products.all
		else
			@products = Product.all
		end
	end

	def show
		@product = Product.find_by(id: params[:id])
		@bid = @product.bids.new
		@bids = @product.bids.all
		@reviews = @product.reviews.all
		@review = @product.reviews.new
	end

	def destroy
		@product = Product.find_by(id: params[:id])
		@product.destroy

		redirect_to products_path
	end

	private
	def product_params
		params.require(:product).permit(:title, :description, :deadline, :minimum_bid)
	end
end
