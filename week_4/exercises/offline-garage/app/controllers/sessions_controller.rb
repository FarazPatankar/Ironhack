class SessionsController < ApplicationController
	def create
		email = params[:email]
		password = params[:password]

		user = User.find_by(email: email)

		if user.password == password
			redirect_to("users/#{user.id}")
		else
			render(:text => "Please check your login details")
		end
	end
end
