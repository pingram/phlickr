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

  def change_favorite
    photo_id = Integer(params[:id])
    if photo_id > 1_000_000
      get_flickr_photo
      check_photo_and_user_existence   # updates photo and user based on db vals
    else
      @photo = Photo.find(photo_id)
    end

    if current_user.favorited_photos.include?(@photo)
      current_user.favorited_photos.delete(@photo)
    else
      FavoritePhoto.create!(user_id: current_user.id, photo_id: @photo.id)
    end
    render partial: "api/photos/photo_original",
      locals: { photo: @photo, current_user: current_user }
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
    render partial: "api/photos/photo_original",
      locals: { photo: @photo, current_user: current_user }
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

  def get_flickr_photo
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
    @photo_user = User.new(username: info['owner']['username'],
      fname: fname, lname: lname, password_digest: 'asdfasdf')
  end

  def check_photo_and_user_existence
    if @photo.url == Photo.last.url       # already created in DB
        @photo = Photo.last
    else
      user_from_db = User.find_by(username: @photo_user.username)
      if !!user_from_db
        @photo_user = user_from_db
      else
        @photo_user.save!
      end
      @photo.user = @photo_user
      @photo.id = nil
      @photo.save!
    end
  end
end