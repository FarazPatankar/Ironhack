class BidsController < ApplicationController
	def create
		id = params[:id]
		email = params[:email]
		bid = params[:bid]

		product = Product.find_by(id: id)
		bid = product.bids.create(email: email, amount: bid)

		redirect_to("/products/#{id}")
	end
end
