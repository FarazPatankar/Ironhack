class UsersController < ApplicationController
	def home
	end

	def show
		id = params[:id]
		@user = User.find_by(id: id)

	end

	def create
		name = params[:name]
		email = params[:email]

		user = User.create(name: name, email: email)

		redirect_to("/users/#{user.id}")
	end

	def destroy
	end

	def new
		@user = User.create
	end
end
