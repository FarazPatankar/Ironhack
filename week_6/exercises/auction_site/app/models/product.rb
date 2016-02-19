class Product < ActiveRecord::Base
  belongs_to :user
  has_many :bids, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
