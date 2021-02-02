class ProjectsController < MainController
  def project
    @project = Project.find(params[:id])
  end

  def destroy
    @project = Project.find(params[:id])
    if @project.delete
      redirect_to root_path
    else
      flash[:error] = "Project deletion failed! #{print_errors(@project)}"
      redirect_to root_path
    end
  end

  private

  def project_params
    params.permit(:name)
  end

  def print_errors project
    project.errors.full_messages.join(", ") + "."
  end
end
