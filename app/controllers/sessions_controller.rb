class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by_email(params[:email])
  
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to ideas_url
    else 
      flash[:error] = 'Invalid Login'
      redirect_to new_session_url
      
    end
  end
  
  def destroy
    reset_session
    redirect_to new_session_url
  end


end
