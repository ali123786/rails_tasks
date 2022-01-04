class ProjectsController < ApplicationController

  def show

  end

  def createPage

  end

  def new
     respond_to do |format|
     format.html { render :new }
  end
  end

  def create

  end

  private
  def project_params
    params.require(:project).permit(:title)
  end
end
