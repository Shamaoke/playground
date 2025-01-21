
class ProjectsController < ApplicationController

  def index
  end

  def new
    @project = Project.new
  end

  def create
    Project.new(project_params) do
      if _1.save
        flash[:notice] = 'Project has been created'
        redirect_to _1
      else
        flash.now[:alert] = 'Project has not been created'
        render :new, assigns: { project: _1 }
      end
    end
  end

  def show
    @project = Project.find_by(id: params[:id])
  end

  private
    def project_params = params.require(:project).permit(:name, :description)
end

