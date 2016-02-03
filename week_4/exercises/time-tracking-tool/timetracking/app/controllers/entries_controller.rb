class EntriesController < ApplicationController
	def index
		id = params[:project_id]

		# @entries = Entry.where(project_id: id)

		# project = Project.find_by(id: id)
		# @entries = project.entries

		@project = Project.find_by(id: id)
		unless @project
			render "projects/no_projects"
		end
	end

	def new
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new
	end
end
