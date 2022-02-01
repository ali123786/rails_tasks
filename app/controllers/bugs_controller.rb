class BugsController < ApplicationController

  def index
    @bugs=Bug.where(assign_to:current_user.id)
  end

  def show
    @bug = Bug.find(params[:id])
  end

  def new
    @bug = Bug.new
    @project_id = params[:project_id]
  end

  def create
    @bug = Bug.new(bug_params)
    if @bug.save
      redirect_to projects_path
    else
      render new_bug_path
    end
  end

  def destroy
    @bug = Bug.find(params[:id])
    @bug.destroy
    redirect_to projects_path
  end
 def assign
      @bug = Bug.find(params[:id])
    if @bug.update_attribute(:assign_to,current_user.id)
        @bug.update_attribute(:status,"started")
      redirect_to '/welcome'
    else
      redirect_to @bug , notice: "Not Assigned"
    end
  end
  def change_status
    @bug = Bug.find(params[:id])
    if @bug.update_attribute(:status,"resolved")
      redirect_to '/welcome'
    else
      redirect_to @bug , notice: "Not Assigned"
    end

  end

  private



  def bug_params
    params.require(:bug).permit(:descriptive_title,:deadline,:bug_type,:status,:screen_shot, :creator_id,:assign_to, :screenshot, :project_id)
  end
end
