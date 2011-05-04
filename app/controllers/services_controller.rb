class ServicesController < ApplicationController
  def new
    @service = Service.new(:project_id=>params[:project_id])
  end

  def create
    @service = Service.new(params[:service])
    @service.save
    logger.info "service " + @service.inspect
    redirect_to service_path(@service)
  end

  def show
    @service = Service.find(params[:id])
  end

  def destroy
    @service = Service.find(params[:id])
    project = @service.project
    @service.delete
    redirect_to project_path(project)
  end

end
