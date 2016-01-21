
class PasswordChecker
	def check_password?(email, password)
		check_length(password) && 
		check_chars(password) &&
		check_case(password) &&
		check_contain(email, password)
	end

	def check_length(password)
		if password.length > 7
			true
		else
			false
		end
	end

	def check_chars(password)
		if password.match(/[a-zA-Z]/) && password.match(/\d/) && password.match(/\W/)
			true
		else
			false
		end
	end

	def check_case(password)
		if password.match(/[a-z]/) && password.match(/[A-Z]/)
			true
		else
			false
		end
	end

	def check_contain(email, password)
		email_array = email.split("@")

		if email_array.length != 2
			return false
		end

		domain_array = email_array[1].split(".")

		if domain_array.length != 2
			return false
		end

		if password.include?(email[0]) || password.include?(domain_array[0])
			false
		else
			true
		end
	end
end