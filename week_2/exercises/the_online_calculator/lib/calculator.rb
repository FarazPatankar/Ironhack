class Calculator
	attr_reader :result
	def add(a,b)
		@result = a + b
		@result
	end

	def subtract(a,b)
		@result = a - b
		@result
	end

	def multiply(a,b)
		@result = a * b
		@result
	end

	def divide(a,b)
		@result = a / b
		@result
	end
end