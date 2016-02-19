class User < ActiveRecord::Base
	has_many :products, dependent: :destroy
	has_many :bids, dependent: :destroy
	has_many :reviews
	has_many :seller_reviews, class_name: :SellerReview, foreign_key: :user_id
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
