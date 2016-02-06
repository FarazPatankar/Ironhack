class Project < ActiveRecord::Base
	validates :name, presence: true
	validates :name, uniqueness: true
	validates :name, length: {maximum: 30}
	validates :name, format: {with: /(\w\s)+/}

	has_many :entries
	has_many :participations
	has_many :people, through: :participations

	def self.clean_old
		d = Date.current
		d = d - 1.week
		projects = where("created_at < ?", d)
		projects.destroy_all
	end

	def self.last_created_projects(number)
		limit(number).order("created_at DESC")
	end

	def total_hours_in_month(month, year)
		sum = 0
		mins_sum = 0

		month = Date.new(year, month)

		entries
		.where(date: month.beginning_of_month..month.end_of_month)
		.each do |entry|
			sum += entry.hours
			mins_sum += entry.minutes
		end

		mins_to_hours = mins_sum/60

		sum + mins_to_hours
	end
end
