class Api::PhotosController < ApplicationController
  def new
    render :new
  end

  def create
    @photo = Photo.new(photo_params)

    fail

    # @photo.user_id = current_user.id
    

    if @photo.save
      redirect_to new_session_url
    else
      flash.now[:errors] = @photo.errors.full_messages
      render action: 'new'
    end
  end

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

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      render json: @photo
    else
      render json: { errors: @photo.errors.full_messages }, status: 422
    end
  end

  def destroy
    current_user.photos.find(params[:id]).try(:destroy)
    render json: @photo
  end

  private
  def photo_params
    params.require(:photo).permit(:user_id, :description, :url, :file)
  end
end
