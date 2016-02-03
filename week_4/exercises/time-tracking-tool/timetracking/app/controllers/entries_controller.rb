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

	def create
		@project = Project.find(params[:project_id])
		@entry = @project.entries.new entry_params

		if @entry.save
			redirect_to action: "index", controller: "entries", project_id: @project.id
		else
			render 'new'
		end
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end
end
