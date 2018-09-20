require 'date'

class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(name: params[:task][:name], description: params[:task][:description])
    if @task.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    id = params[:id].to_i
    @task = Task.find_by(id: id)
  end

  def edit
    id = params[:id].to_i
    @task = Task.find_by(id: id)
  end

  def update
    id = params[:id].to_i
    @task = Task.find_by(id: id)
    @task.name = params[:task][:name]
    @task.description = params[:task][:description]
    @task.completion_date = params[:task][:completion_date]

    if @task.save
      redirect_to task_path
    else
      render :new
    end
  end

  def complete
    @task = Task.find(params[:id].to_i)

    if @task.completion_date == ''
      @task.completion_date = DateTime.now
    else
      @task.completion_date = ''
    end

    if @task.save
      redirect_to root_path
    end
  end

  def destroy
    task = Task.find(params[:id].to_i)
    task.destroy
    redirect_to root_path
  end
end
