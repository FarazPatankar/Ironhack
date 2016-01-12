class InvisibleCar < Car
	def rev
		puts "Cloaking activated by my #{@color} #{@make}"

		#Calls Car's rev method because Car is the parent class
		super
	end
end