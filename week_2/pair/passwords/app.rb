
# app.rb

require "sinatra"
require "sinatra/reloader" if development?
require_relative("lib/passwordchecker.rb")


get "/" do
	erb(:home)
end

post "/login" do
	@passwordchecker = PasswordChecker.new
	email = params[:email]
	password = params[:password]

	if @passwordchecker.check_password?(email, password)
		redirect to("/congratulations")
	else
		redirect to("/sorry")
	end
end

get "/congratulations" do
	erb(:congratulations)
end

get "/sorry" do
	erb(:sorry)
end