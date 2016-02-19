class ReviewsController < ApplicationController
	def create
		@product = Product.find_by(id: params[:product_id])
		@review = @product.reviews.new(review_params)
		@review.user = current_user
		@review.save

		redirect_to product_path(@product)
	end

	def index
		@user = User.find_by(id: current_user.id)
		@reviews = @user.reviews.all
	end

	def destroy
		@product = Product.find_by(id: params[:product_id])
		@review = Review.find_by(id: params[:id])
		@review.destroy

		redirect_to product_path(@product)
	end

	private
	def review_params
		params.require(:review).permit(:description)
	end
end
