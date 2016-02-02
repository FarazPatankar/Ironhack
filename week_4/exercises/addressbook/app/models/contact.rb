class Contact < ActiveRecord::Base

	def self.contact_validate(name, address, phone_number, email)
		if name_validate(name) && address_validate(address) && phone_number_validate(phone_number) && email_validate(email)
		end
	end

	def self.name_validate(name)
		# name_validator = NameValidator.new(name, {max_length: 10, presence: true, min_length: 2 })
		if name.length > 0
		end
	end

	def self.address_validate(address)
		if address.length > 0
		end
	end

	def self.phone_number_validate(phone_number)
		if phone_number.gsub(/[\d -]/, "").length == 0
		end
	end

	def self.email_validate(email)
		if email.gsub(/[\w @ .]/, "").length == 0
		end
	end
end
