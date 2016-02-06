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
			flash[:notice] = "Entry Created!"
			redirect_to action: "index", controller: "entries", project_id: @project.id
		else
			flash[:alert] = "Unable to create entry!"
			render 'new'
		end
	end

	def edit
		@project = Project.find(params[:project_id])
		@entry = @project.entries.find(params[:id])
	end

	def update
		@project = Project.find(params[:project_id])
		@entry = @project.entries.find(params[:id])

		if @entry.update(entry_params)
			redirect_to action: "index", controller: "entries", project_id: @project
		else
			render 'edit'
		end
	end

	def destroy
		project = Project.find_by(id: params[:project_id])
		entry = Entry.find_by(id: params[:id])
		entry.destroy

		redirect_to project_entries_path(project)
	end

	private

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end
end
