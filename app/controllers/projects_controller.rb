class ProjectsController < ApplicationController
  def index
    @projects = Project.find(:all)
  end

  def new
   @project = Project.new
  end

  def create
    @project = Project.new(params[:project]).save
    redirect_to projects_path
  end

  def show
    @project = Project.find(params[:id])

  end

  def destroy
    @project = Project.find(params[:id])
    @project.delete
    redirect_to projects_path
  end


end
