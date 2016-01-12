class Person
	attr_reader :name
	attr_accessor :age
	def initialize(name, age)
		@name = name
		@age = age
	end
end

nizar = Person.new("Nizar", 33)
puts nizar.name
nizar.age = 40
puts nizar.age
nizar.name = "Josh"
puts nizar.name