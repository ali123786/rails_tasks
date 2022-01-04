class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  def new
   
  end

  def login

  end
  def create
     @user = User.find_by(name: params[:name])
     if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to '/welcome'
     else
      render 'new'
     end
   end
   def page_requires_login
   end
  

  def destroy
    session.delete :user_id
    redirect_to root_path
  end

end
