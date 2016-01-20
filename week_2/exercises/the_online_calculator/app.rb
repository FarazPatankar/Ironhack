require "sinatra"
require_relative("lib/calculator.rb")

get "/" do
	erb(:homepage)
end
# get "/:word" do
# 	@word = params[:word]
# 	erb(@word.to_sym)
# end

# get "/add" do
# 	erb(:add)
# end

# get "/subtract" do
# 	erb(:subtract)
# end

# get "/multiply" do
# 	erb(:multiply)
# end

# get "/divide" do
# 	erb(:divide)
# end

calculator = Calculator.new

post "/calculate" do
	operation = params[:operation]
	result = params[:result]
	first = params[:first_number].to_f
	second = params[:second_number].to_f

	if operation == "add"
		calculator.add(first,second)
	elsif operation == "subtract"
		calculator.subtract(first,second)
	elsif operation == "multiply"
		calculator.multiply(first,second)
	else
		calculator.divide(first,second)
	end
	@result = calculator.result
	erb(:calculate)
end

post "/calculate_using_result" do
	result = params[:save]
	# @result_to_store = calculator.result
	IO.write("public/result", result)
	@stored_result = IO.read("public/result")
	erb(:calculate_using_result)
end