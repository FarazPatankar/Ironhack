class Bid < ActiveRecord::Base
	belongs_to :product
	has_many :reviews
end
