class Api::UsersController < ApplicationController

  def profile
    @user = current_user
    render partial: "api/users/profile", locals: { user: @user }
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end  

end