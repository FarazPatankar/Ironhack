class User < ActiveRecord::Base
	has_many :registrations
	has_many :barbecues, through: :registrations
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
