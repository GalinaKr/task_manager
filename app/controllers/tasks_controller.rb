class TasksController < ApplicationController
  def destroy
    if task.delete
      redirect_to root_path
    else
      flash[:error] = "Task deletion failed! #{print_errors(task)}"
      redirect_to root_path
    end
  end

  def status
    task.status == 'done' ? st = 0 : st=1
    task.update(status: st)

    redirect_to root_path
  end

  def task
    @task = Task.find(task_params)
  end

  def task_params
    params[:action] == 'status' ? params[:task_id] : params[:id]
  end

end
