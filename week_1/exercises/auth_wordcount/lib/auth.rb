class Auth
	attr_reader :username, :password
	def initialize(username, password)
		@username = username
		@password = password
	end

	def login
		puts "Username:"
		username = gets.chomp
		puts "Password:"
		password = gets.chomp

		if username == @username && password == @password
			puts "Welcome back #{username}"
			true
		else
			false
		end
	end
end