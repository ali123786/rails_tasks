class BugsController < ApplicationController

  def index
    @bugs=Bug.where(assign_to:current_user.id)
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
    @project = Project.find(params[:project_id])
  end

  def create
    @bug = Bug.new(bug_params)
    if @bug.save
      redirect_to projects_path
    end
  end

  def destroy
    #@bug = Bug.find(params[:id]).destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    redirect_to projects_path
  end


  private



  def bug_params
    params.require(:bug).permit(:descriptive_title,:deadline,:bug_type,:status,:screen_shot,:project_id)
  end
end
