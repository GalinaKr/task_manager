module Tasks
  include Projects

  def tasks
    @tasks = project.tasks.all
  end

  def add_task
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      flash[:error] = "Task creation failed! #{print_errors(@task)}"
      redirect_to root_path
    end
  end

  def update_task
    if task.update(update_task_params)
      redirect_to root_path
    else
      flash[:error] = "Task failed to update! #{print_errors(task)}"
      redirect_to root_path
    end
  end

  private

  def project
    @project = Project.find(params[:format])
  end

  def task
    @task = Task.find(params[:format])
  end

  def task_params
    params.require(:task).permit(:name).merge(project_id: params[:format])
  end

  def update_task_params
    params.require(:task).permit(:name).merge(id: params[:format])
  end

  def print_errors task
    task.errors.full_messages.join(", ") + "."
  end
end