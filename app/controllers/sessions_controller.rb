class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:guest]
      user = User.find(1)
    else
      user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password])
    end
    
    if user
      login(user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new, status: 401
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end
end