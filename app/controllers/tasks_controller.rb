class TasksController < ApplicationController
  before_action :authenticate_user!

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

  def show
    @tasks = current_user.tasks.all
  end

  def mark_as_completed
    @task = Task.find(params[:id])
    @task.update(completed: true)
    redirect_to root_path, notice: 'Task was marked as completed.'
  end

  def mark_as_pending
    @task = Task.find(params[:id])
    @task.update(completed: false)
    redirect_to root_path, notice: 'Task was marked as pending.'
  end

  def remove
    @task = Task.find(params[:id])

    puts @task
    
    if @task.destroy
      redirect_to root_path, notice: 'Task was removed successfully.'
    else
      redirect_to root_path, notice: 'Something went wrong while removing the task.'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :due_date, :completed)
  end
end