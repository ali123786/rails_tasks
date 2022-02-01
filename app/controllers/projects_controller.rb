class ProjectsController < ApplicationController

  def index
    if current_user.user_type == 'developer'
      @pro=ProjectUser.where(user_id:current_user.id).pluck(:project_id)
      @projects=Project.where(id: @pro)
    else
    @projects = Project.accessible_by(current_ability)
    end
  end

  def show
    @project = Project.find(params[:id])
    @project_id = Project.find(params[:id])
    @bugs=Bug.where(project_id: @project_id)
    @p_user=ProjectUser.where(project_id: @project_id).pluck(:user_id)

    @project_username=User.where(id:@p_user)
     @user=User.all
     @project_user=ProjectUser.where(user_id:@p_user)
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
     @user = current_user.id
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

  def remove_user
    @project_id = params[:project_id]
    @user_id = params[:user_id]
    @project_user=ProjectUser.where(project_id:@project_id,user_id:@user_id).pluck(:id)
    if ProjectUser.destroy(@project_user)
      redirect_to '/projects'
    end
  end

  private
    def project_params
      params.require(:project).permit(:user_id, :title, :projectid, :user_assigned)
    end
end
