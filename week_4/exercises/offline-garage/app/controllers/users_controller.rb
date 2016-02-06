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
		password = params[:password]

		user = User.create(name: name, email: email, password: password)

		redirect_to("/")
	end

	def login
		email = params[:email]
		password = params[:password]

		user = User.find_by(email: email)

		if user.password == password
			redirect_to("users/#{user.id}")
		else
			render(:text => "Please check your login details")
		end
	end

	def destroy
	end

	def new
		@user = User.create
	end
end
