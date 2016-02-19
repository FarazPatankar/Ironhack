class Bid < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :amount,
		presence: true,
		uniqueness: true
  	validates :product_id,
  		presence: true
  	validates :user_id,
  		presence: true
end
