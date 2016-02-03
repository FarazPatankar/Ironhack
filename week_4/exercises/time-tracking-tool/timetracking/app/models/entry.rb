class Entry < ActiveRecord::Base
	validates :hours, format: {with: /[0-9]/}
	validates :minutes, format: {with: /[0-9]/}
	validates :hours, presence: true
	validates :minutes, presence: true
	validates :date, presence: true

	belongs_to :project
end
