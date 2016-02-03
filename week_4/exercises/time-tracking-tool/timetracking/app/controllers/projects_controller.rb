class ProjectsController < ApplicationController
  def index
  	@projects = Project.last_created_projects(10)

  	if @projects.empty?
  		render "no_projects"
  	else
  		render "index"
  	end
  end

  def show
  	id = params[:id]
  	@project = Project.find_by(id: id)

  	if @project
  		render "show"
  	else
  		render "no_projects"
  	end
  end
end
