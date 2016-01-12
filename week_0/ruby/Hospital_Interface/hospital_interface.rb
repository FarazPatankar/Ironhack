class Hospital
	attr_reader :name, :location, :employees, :patients
	def initialize(name, location, employees, patients)
		@name = name
		@location = location
		@employees = employees
		@patients = patients
	end
end

class Patient
	attr_reader :name, :age, :issue, :patients
	def initialize(name, age, issue)
		@name = name
		@age = age
		@issue = issue
	end
end

class Employees
	attr_reader :name, :job
	def initialize(name, job)
		@name = name
		@job = job
	end
end

class AuthenticationSystem
	def initialize
		@patients = []
	end

	def add_patient(patient)
		@patients.push(patient)
	end

	def login
		puts "Welcome to"
		puts "Enter your username :"
		username = gets.chomp
		puts "Enter your password :"
		password = gets.chomp

		if username == "patient" && password == "helpme"
			puts "What would you like to do today?"
			puts "1: Call the doctor"
			puts "2: Pay your bills and leave"
			puts "3: Exit"
			patient_input = gets.chomp.to_i
			if patient_input == 1
				puts "The doctor will be with you immediately"
			elsif patient_input == 2
				puts "Your final bill is $$$$$"
			elsif patient_input == 3
				puts "Bye"
			else
				puts "Invalid input, please login again."
				login
			end
		elsif username == "doctor" && password == "helpyou"
			puts "What would you like to do today?"
			puts "1: Access patients list"
			puts "2: Exit"
			doctor_input = gets.chomp.to_i
			if doctor_input == 1
				@patients.each do |x|
					puts x.name + x.age + x.issue
				end
			elsif doctor_input == 2
				puts "Bye"
			else
				puts "Invalid input, please login again"
				login
			end
		else
			puts "What was that?"
		end								
	end
end

hospital = Hospital.new("Random Hospital", "Random Location", "One Employee", "Two Patients")
auth = AuthenticationSystem.new
alex = Patient.new("Alex", 25, "Cold")
tom = Patient.new("Tom", 27, "Fever")
auth.add_patient(alex)
auth.add_patient(tom)
auth.login