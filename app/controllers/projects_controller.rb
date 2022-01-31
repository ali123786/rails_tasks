class ProjectsController < ApplicationController

  def index
    @project = Project.all
  end

  def show
      @project = Project.find(params[:id])
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to projects_path
    else
      render 'projects#new'
    end
  end
  def edit
       @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      redirect_to projects_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  def add_user
    @user = Project_users.find(params[:user_id])
    if @project&.users << @user
      redirect_to project
    else
      redirect_to projects_path, notice: "Can not add user to project"
    end
  end

  def remove_user
    if @project.users.destroy(@user)
      redirect_to @project
    else
      redirect_to projects_path, notice: "Can not remove user from project"
    end
  end

  private
    def project_params
      params.require(:project).permit(:user_id,:title)
    end
end
