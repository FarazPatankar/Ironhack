class Barbecue < ActiveRecord::Base
  has_many :items
  has_many :registrations
  has_many :users, through: :registrations

  validates :title, presence: true
  validates :venue, presence: true
  validates :date, presence: true
end
