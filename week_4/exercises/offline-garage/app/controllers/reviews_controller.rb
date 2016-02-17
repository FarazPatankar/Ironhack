class ReviewsController < ApplicationController

	def create
		id = params[:id]
		product = Product.find_by(id: id)
		product.reviews.create(review_params)
		redirect_to("/products/#{id}")

	end

	private
	def review_params
		params.require(:review).permit(:description)
	end
end
