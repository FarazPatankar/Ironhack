class BidsController < ApplicationController
	def create
		@product = Product.find_by(id: params[:product_id])
		@bid = @product.bids.new(bid_params)
		@bid.user = current_user
		if @bid.amount >= @product.minimum_bid
			@bid.save
			redirect_to product_path(@product)
		else
			redirect_to :back
		end
	end

	def index
		@user = User.find_by(id: current_user.id)
		@bids = @user.bids.all
	end

	private
	def bid_params
		params.require(:bid).permit(:amount)
	end
end