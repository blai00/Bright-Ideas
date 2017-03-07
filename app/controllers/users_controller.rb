class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  
  def create
    user = User.create(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to ideas_url 
    else
      flash[:message] = user.errors.full_messages
      redirect_to new_session_url
    end
    
  end
  
  def show
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
  end
  def set_user
    @user = User.find(params[:id])
  end
end
