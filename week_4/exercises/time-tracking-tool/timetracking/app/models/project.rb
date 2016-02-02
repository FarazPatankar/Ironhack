class Project < ActiveRecord::Base
	def self.clean_old
		d = Date.current
		d = d - 1.week
		projects = where("created_at < ?", d)
		projects.destroy_all
	end

	def self.last_created_projects(number)
		limit(number).order("created_at DESC")
	end
end
