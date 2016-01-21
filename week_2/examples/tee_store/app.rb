require "sinatra"
require "sinatra/reloader" if development?

inventory = [ "Deep V T-Shirt", "Ed Hardy T-Shirt", "Cat T-Shirt"]

enable(:sessions)


#list of shirts
get "/" do
	@shirts = inventory

	if session[:cart].nil?
		session[:cart] = []
	end
	@number_of_items = session[:cart].length

	erb(:tshirts)
end

#single shirt page
get "/tshirts/:tshirt_number" do
	@tshirt_number = params[:tshirt_number].to_i
	@tshirt_type = inventory[@tshirt_number - 1]
	erb(:tshirt_page)
end

post "/add_to_cart" do
	tshirt_id = params[:tshirt_id]

	if session[:cart].nil?
		session[:cart] = []
	end

	session[:cart].push(tshirt_id)

	redirect to("/")
end

get "/checkout" do
	if session[:cart].nil?
		session[:cart] = []
	end

	id_array = session[:cart]
	@checkout_array = []

	id_array.each do |id|
		@checkout_array.push(inventory[id.to_i - 1])
	end

	erb(:checkout)
end