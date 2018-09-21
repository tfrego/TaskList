require 'date'

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @task = Task.find_by(id: params[:id].to_i)
  end

  def edit
    @task = Task.find_by(id: params[:id].to_i)
  end

  def update
    task = Task.find_by(id: params[:id].to_i)
    task.update(task_params)

    redirect_to task_path(task.id)
  end

  def complete
    @task = Task.find_by(id: params[:id].to_i)

    if @task.completion_date == nil
      @task.completion_date = DateTime.now
    else
      @task.completion_date = nil
    end

    if @task.save
      redirect_to root_path
    end
  end

  def confirm
    @task = Task.find_by(id: params[:id].to_i)
  end

  def destroy
    task = Task.find_by(id: params[:id].to_i)
    task.destroy
    redirect_to root_path
  end

  private

  def task_params
    return params.require(:task).permit(:name, :description)
  end

end
