require_relative("car.rb")

class FlyingCar < Car
	def fly
		puts "Up! Up! and Away! My #{@color} #{@make}"
	end
end