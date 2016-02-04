class BidsController < ApplicationController
	def create
		id = params[:id]
		email = params[:email]
		bid = params[:bid]

		@product = Product.find_by(id: id)
		minimum_bid = @product.minimum_bid

		@bids = @product.bids.all
		winning_bidder = @bids.order("amount DESC").first
		winning_bid = winning_bidder.amount

		if @product.user.email == email
			render(:text => "You can't bid on your own product, bro.")
		elsif @product.deadline > Time.now && bid.to_i > winning_bid && bid.to_i > minimum_bid
			@product.bids.create(email: email, amount: bid)
			redirect_to("/products/#{id}")
		else
			render(:text => "You bid has to be greater than the minimum bid/current winning bid")
		end

	end
end
