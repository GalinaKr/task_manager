class MainController < ApplicationController
  include Projects
  include Tasks

  def index
    projects
  end

  def add_project
    super
  end

  def add_task
    super
  end

  def update_task
    super
  end

  def update_project
    super
  end

  def project
    @project ||= params[:id]
  end
end
