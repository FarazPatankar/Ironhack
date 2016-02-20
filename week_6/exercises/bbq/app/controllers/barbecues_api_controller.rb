class BarbecuesApiController < ApplicationController
	protect_from_forgery with: :null_session

	def show
		barbecue = Barbecue.find_by(id: params[:id])
		render json: barbecue
	end

	def join
		barbecue = Barbecue.find_by(id: params[:id])
		user = User.find_by(id: current_user.id)

		barbecue.users.push(user)
		barbecue.save
		render json: barbecue.to_json({:include => :users})
	end

	def create_item
		barbecue = Barbecue.find_by(id: params[:id])
		item = barbecue.items.new(item_params)
		item.save
		render json: item
	end

	private
	def item_params
		params.require(:item).permit(:name)
	end
end
