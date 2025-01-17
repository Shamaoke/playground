
class ProjectsController < ApplicationController

  def index
  end

  def new
    @project = Project.new
  end

  def create
    Project.new(project_params) do
      _1.save and redirect_to _1, notice: 'Project has been created'
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  private
    def project_params = params.require(:project).permit(:name, :description)
end

