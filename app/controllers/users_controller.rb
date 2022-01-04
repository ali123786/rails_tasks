class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  
  def new
    @user = User.new
  end

   def create
   @user = User.create(params.require(:user).permit(:name,
   :password))
   session[:user_id] = @user.id
   redirect_to '/login#new'
   end

  private 

  def user_params
    params.require(:user).permit(:name, :email, :password, :user_type)
end
end
