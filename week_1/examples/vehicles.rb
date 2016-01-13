class Helicopter
	attr_reader :wheels, :sound
	def initialize
		@wheels = 3
		@sound = "TuTuTuTu"
	end
end

chopper = Helicopter.new

class Car
	attr_reader :wheels, :sound
	def initialize
		@wheels = 4
		@sound = "Vroooooom"
	end
end

ferrari = Car.new

class Motorcycle
	attr_reader :wheels, :sound
	def initialize
		@wheels = 2
		@sound = "Brrrm Brmm"
	end
end

ducati = Motorcycle.new

class WheelCount
	def initialize
		@vehicles = []
	end

	def add_vehicle(vehicle)
		@vehicles.push(vehicle)
	end
	
	def wheel_count
		total_wheels = 0
		@vehicles.each do |vehicle|
			total_wheels += vehicle.wheels
		end
		puts total_wheels
	end
end

class PrintNoises
	def initialize
		@vehicles = []
	end

	def add_vehicle(vehicle)
		@vehicles.push(vehicle)
	end

	def make_noise
		@vehicles.each do |vehicle|
			puts vehicle.sound
		end
	end
end

counter = WheelCount.new
counter.add_vehicle(chopper)
counter.add_vehicle(ferrari)
counter.add_vehicle(ducati)
counter.wheel_count

make_some_noise = PrintNoises.new
make_some_noise.add_vehicle(chopper)
make_some_noise.add_vehicle(ferrari)
make_some_noise.add_vehicle(ducati)
make_some_noise.make_noise