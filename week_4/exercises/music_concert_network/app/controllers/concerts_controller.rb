require 'date'

class ConcertsController < ApplicationController
	def new
		@concert = Concert.new
	end

	def index
		@concerts_today = Concert.where("date < ?", Date.tomorrow)
		@concerts_this_month = Concert.where("date > ?", Date.tomorrow).where("date < ?", Time.now + 1.month)
	end

	def create
		Concert.create(concert_params)

		redirect_to concerts_path
	end

	def show
		id = params[:id]
		@concert = Concert.find_by(id: id)
		@comment = @concert.comments.new
		@comments = @concert.comments.all
	end

	def search
	end

	def results
		@price = params[:price]
		@concerts = Concert.where("price <= ?", @price)
	end

	def popular
		@concerts = Concert.all.includes(:comments)
		@sorted_concerts = @concerts.sort_by do |concert|
			-concert.comments.count
		end

	end

	private

	def concert_params
		params.require(:concert).permit(:artist, :venue, :city, :date, :price, :description, :poster)
	end
end
