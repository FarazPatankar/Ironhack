class Contact < ActiveRecord::Base

	def self.contact_validate(name, address, phone_number, email)
		if name_validate(name) && address_validate(address) && phone_number_validate(phone_number) && email_validate(email)
			true
		end
	end

	def self.name_validate(name)
		# name_validator = NameValidator.new(name, {max_length: 10, presence: true, min_length: 2 })
		if name.length > 0
			true
		end
	end

	def self.address_validate(address)
		if address.length > 0
			true
		end
	end

	def self.phone_number_validate(phone_number)
		if phone_number.gsub(/[0-9]{3}-[0-9]{3}-[0-9]{4}/, "").length == 0
			true
		end
	end

	def self.email_validate(email)
		if email =~ /^([a-zA-Z0-9_\.-]+)@([\da-z\-]+)\.([a-z]{2,6}\.)?[a-z]{2,6}$/
			true
		end
	end
end
