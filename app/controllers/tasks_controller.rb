class TasksController < ApplicationController
  def index
    @tasks  = Task.all
  end

  def show
    @tasks  = Task.find(params[:id])
  end

  def new
    @tasks  = Task.new
  end

  def create
    @tasks  = Task.new(task_params)
    
    if @task.save
      flash[:success] = 'Taskが正常に登録されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskの登録に失敗しました'
      render:new
    end
  end

  def edit
    @tasks  = Task.find(params[:id])
  end

  def update
    @tasks  = Task.find(params[:id])
    
    if @task.update(task_params)
      flash[:success] = 'Taskが正常に更新されました'
      redirect_to @task
    else
      flash.now[:danger] = 'Taskの更新に失敗しました'
      render:edit
    end
  end

  def destroy
    @tasks  = Task.find(params[:id])
    @task.destroy
    
    flash[:success] = "Taskは正常に削除されました。"
    redirect_to tasks_url
  end
  
  private
  def task_params
    params.require(:task).permit(:content)
  end
end
