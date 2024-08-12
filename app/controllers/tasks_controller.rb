class TasksController < ApplicationController
  before_action :authenticate_user! # Ensure user is authenticated before accessing these actions

  def show
    @tasks = current_user.tasks
  end

  def new
    @task = current_user.tasks.build
  end

  def create
    @task = current_user.tasks.build(task_params)
    if @task.save
      redirect_to root_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end
end