class Car
	def initialize(name)
		@name = name
	end

	def noise
		puts "vroom"
	end
end

car = Car.new("Toyota")
car.noise