module Projects
  def projects
    @projects = Project.all
  end

  def update_project
    @project = Project.find(params[:format])
    if @project.update(project_params)
      redirect_to root_path
    else
      flash[:error] = "Project failed to update! #{print_errors(@project)}"
      redirect_to root_path
    end
  end

  def add_project
    @project = Project.new(project_params)
    if @project.save
      redirect_to root_path
    else
      flash[:error] = "Project creation failed! #{print_errors(@project)}"
      redirect_to root_path
    end
  end

  private

  def project_params
    params.require(:project).permit(:name)
  end

  def print_errors project
    project.errors.full_messages.join(", ") + "."
  end
end