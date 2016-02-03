class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true
	has_many :products
end
