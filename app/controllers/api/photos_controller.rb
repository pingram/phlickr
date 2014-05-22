class Api::PhotosController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos
    render json: @photos
  end

  def show
    @photo = Photo.find(params[:id])
    render json: @photo
  end

  # def create
  #   @photo = current_user.photos.build(photo_params)
  #   if @photo.save
  #     render partial: "api/photos/photo", locals: { photo: @photo }
  #   else
  #     render json: { errors: @photo.errors.full_messages }, status: 422
  #   end
  # end

  # def update
  #   @photo = current_user.photos.find(params[:id])


  #   if params[:newMemberEmail]
  #     email = params[:newMemberEmail]
  #     new_member = User.find_by_email(email)
  #     new_member && !@photo.members.include?(new_member) && @photo.members << new_member
  #   end

  #   if @photo.update_attributes(photo_params)
  #     render partial: "api/photos/photo", locals: { photo: @photo }
  #   else
  #     render json: { errors: @photo.errors.full_messages }, status: 422
  #   end
  # end

  def destroy
    current_user.photos.find(params[:id]).try(:destroy)
    render json: @photo
  end

  private
  def photo_params
    params.require(:photo).permit(:user_id, :description, :description, :url)
  end
end
