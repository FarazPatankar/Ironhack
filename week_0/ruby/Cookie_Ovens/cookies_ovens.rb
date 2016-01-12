class Cookie
	attr_reader :name
	def initialize(name)
		@name = name
	end
end

class Oven
	attr_accessor :time
	def initialize
		@time = 0
	end

	def cook_for_five
		@time += 5
	end

	def cook_for_10
		@time += 10
	end

	def cook_for_15
		@time += 15
	end

end

class Chocolate < Cookie
	def burnt
		if Oven.time > 10
			true
		end
	end

	def ready
		if @time == 10
			true
		end
	end

	def cookies_out
		if ready
			puts "Your cookies are ready. Enjoy!"
		elsif burnt
			puts "Your cookies are burnt, you must start over."
		end
	end
end

# class PeanutButter < Cookie
# 	def almost_ready
# 		@time = 14
# 	end

# 	def burnt
# 		@time = 16
# 	end

# 	def ready
# 		@time = 15
# 	end

# 	def cookies_out
# 		if @time == 15
# 			puts "Your cookies are ready. Enjoy!"
# 		elsif @time < 15
# 			puts "They need more time before they are ready."
# 		elsif @time > 15
# 			puts "Your cookies are burnt, you must start over."
# 		end
# 	end
# end

chocolate = Chocolate.new("Chocolate Chip")
oven = Oven.new()
oven.cook_for_15
chocolate.cookies_out