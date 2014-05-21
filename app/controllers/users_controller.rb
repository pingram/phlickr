class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def profile
    @user = current_user
    render json: @user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login(@user)
      redirect_to root_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end