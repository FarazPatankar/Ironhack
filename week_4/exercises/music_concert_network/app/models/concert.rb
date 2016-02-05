class Concert < ActiveRecord::Base
	has_attached_file :poster, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :poster, content_type: /\Aimage\/.*\Z/

	validates :artist, presence: true
	validates :venue, presence: true
	validates :city, presence: true
	validates :date, presence: true
	validates :price, presence: true

	has_many :comments
end
