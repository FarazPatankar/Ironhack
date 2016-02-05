class ConcertsController < ApplicationController
	def new
		@concert = Concert.new
	end

	def index
		@concerts = Concert.all
	end

	def create
		Concert.create(concert_params)

		redirect_to concerts_path
	end

	def show
		id = params[:id]
		@concert = Concert.find_by(id: id)
	end

	private

	def concert_params
		params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description)
	end
end
