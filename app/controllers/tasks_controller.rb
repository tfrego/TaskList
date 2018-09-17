TASKS = [
  { task_desc: "Task One", status: "complete" },
  { task_desc: "Task Two", status: "complete" },
  { task_desc: "Task Three", status: "complete" },
  { task_desc: "Task Four", status: "complete" }
]

class TasksController < ApplicationController
  def index
    @tasks = TASKS
  end
end
