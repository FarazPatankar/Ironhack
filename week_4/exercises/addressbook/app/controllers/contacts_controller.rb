class ContactsController < ApplicationController
	def home
		@contacts = Contact.all.order("name ASC")
	end

	def new
	end

	def create
		name = params[:contact][:name]
		address = params[:contact][:address]
		phone_number = params[:contact][:phone_number]
		email = params[:contact][:email]

		if Contact.contact_validate(name,address,phone_number,email)

	    	contact = Contact.new(
	      		:name => params[:contact][:name],
	      		:address => params[:contact][:address],
	      		:phone_number => params[:contact][:phone_number],
	      		:email => params[:contact][:email])


			    contact.save
			    redirect_to("/contacts")
	    else
	    	render(:incorrect_details)
	    end
	end

	def show
		id = params[:id]
		@contact = Contact.find_by(id: id)
	end

	def favorite_contacts
		@contacts = Contact.all.order("name ASC")
	end
end
