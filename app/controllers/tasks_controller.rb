class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new # Needed to instantiate the form_for
  end

  def create
    @task = Task.new(params[:task])
    @task.save # Will raise ActiveModel::ForbiddenAttributesError

    redirect_to task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :complete)
  end
end
