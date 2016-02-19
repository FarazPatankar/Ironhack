class SellerReview < ActiveRecord::Base
  belongs_to :author, class_name: :User, foreign_key: :subject_id
  belongs_to :subject, class_name: :User, foreign_key: :author_id
  belongs_to :product
end
