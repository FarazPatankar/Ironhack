require "sinatra"

get "/" do
	@greeting = "Hello."
	@time = Time.now
	@formatted_time = @time.strftime("Printed on %m/%d/%Y at %T")
	erb(:author)
end

get "/about" do
	"I am Batman."
end

get "/hours/ago/:number" do
	@number = params[:number]
	number = (@number.to_i) * 3600
	t = Time.now
	@time = t - number
	erb(:hours)
end