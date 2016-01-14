class Auth
	attr_reader :username, :password
	def initialize
		@username = username
		@password = password
	end

	def login
		puts "Username:"
		username = gets.chomp
		puts "Password:"
		password = gets.chomp

		if username == "nizar" && password == "swordfish"
			puts "Welcome back #{username}"
			true
		else
			false
		end
	end
end