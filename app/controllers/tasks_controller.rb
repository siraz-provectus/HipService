class TasksController < ApplicationController
	expose (:tasks) {
    current_user.tasks
  }
  expose :task, attributes: :task_params

  def index
  end

  def new
  end

  def create
    date_end = Date.strptime(params[:task][:end_date], '%m/%d/%Y') if params[:task][:end_date].present?
    @task = Task.create(task_params.merge!(end_date: date_end))
    flash[:error] = @task.errors.full_messages if @task.errors.present?
  end

  def update
  	task.update(task_params)
  end

  private
    def task_params
      params.require(:task).permit(:user_id, :description, :end_date, :status)
    end
end