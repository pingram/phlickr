require 'addressable/uri'

class Api::PhotosController < ApplicationController
  include Api::PhotosHelper

  def new
    render :new
  end

  # def create
  #   @photo = Photo.new(photo_params)
  #   @photo.user_id = current_user.id

  #   if @photo.save
  #     redirect_to new_session_url
  #   else
  #     flash.now[:errors] = @photo.errors.full_messages
  #     render action: 'new'
  #   end
  # end

  def explore
    @photo_rows = get_explore_photos(params[:page_num], params[:page_width])

    # @photos = Photo.find(:all, :order => "id desc", :limit => 2).reverse
    render partial: "api/photos/sized_photos", locals: { photo_rows: @photo_rows }
  end

  def favorites
    @photos = current_user.favorited_photos

    render partial: "api/photos/photos", locals: { photos: @photos }
  end


  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos.order(:id)
    render partial: "api/photos/photos", locals: { photos: @photos }
  end

  def show
    if Integer(params[:id]) < 1_000_000
      @photo = Photo.find(params[:id])
    else  # it's a Flickr photo
      get_flickr_photo
    end
    render partial: "api/photos/photo_original", locals: { photo: @photo }
  end

  def create
    @photo = current_user.photos.build(:file => params[:photo])

    if @photo.save
      render partial: "api/photos/photo", locals: { photo: @photo }
    else
      render json: { errors: @photo.errors.full_messages }, status: 422
    end
  end

  def update
    @photo = Photo.find(params[:id])

    if @photo.update_attributes(photo_params)
      render partial: "api/photos/photo", locals: { photo: @photo }
    else
      render json: { errors: @photo.errors.full_messages }, status: 422
    end
  end

  def destroy
    current_user.photos.find(params[:id]).try(:destroy)
    render partial: "api/photos/photo", locals: { photo: @photo }
  end

  private
  def photo_params
    params.require(:photo).permit(:user_id, :description, :url, :file)
  end

  def get_flickr_photo()
    FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    FlickRaw.shared_secret = ENV["FLICKR_SECRET"]
    info = flickr.photos.getInfo(:photo_id => params[:id])
    url = FlickRaw.url_b(info)
    name = info['owner']['realname'].split(' ')
    fname = name[0]
    lname = name[1]
    description = info['title']
    @photo = Photo.new(id: Integer(params[:id]), url: url, #fname: fname, lname: lname,
      description: description)
  end
end