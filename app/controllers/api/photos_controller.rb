require 'addressable/uri'

class Api::PhotosController < ApplicationController

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

    # getExploreUrls
    photoExploreUrl = Addressable::URI.new(
      :scheme => "https",
      :host => "api.flickr.com",
      :path => "services/rest/",
      :query_values => {:method => "flickr.interestingness.getList",
        :api_key => ENV["FLICKR_API_KEY"],
        :format => "json",
        :nojsoncallback => "1",
      }
    ).to_s

    FlickRaw.api_key = ENV["FLICKR_API_KEY"]
    FlickRaw.shared_secret=ENV["FLICKR_SECRET"]

    json_photos = RestClient.get(photoExploreUrl)
    photos = JSON.parse(json_photos)["photos"]["photo"]
    small_list = photos[0..4]
    photo_m_urls = []
    small_list.each do |photo_hash|
      id = photo_hash['id']
      secret = photo_hash['secret']
      server_id = photo_hash['server']
      size = 'm'

      newPhotoUrl = Addressable::URI.new(
        :scheme => "http",
        :host => "farm#{photo_hash['farm']}.staticflickr.com",
        :path => "#{server_id}/#{id}_#{secret}_#{size}.jpg"
      ).to_s

      photo_m_urls << newPhotoUrl
    end

    fail

    @photos = Photo.find(:all, :order => "id desc", :limit => 2).reverse
    render partial: "api/photos/photos", locals: { photos: @photos }
  end

  def index
    @user = User.find(params[:user_id])
    @photos = @user.photos.order(:id)
    render partial: "api/photos/photos", locals: { photos: @photos }
  end

  def show
    @photo = Photo.find(params[:id])
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

  # def getExploreUrls
  #   debugger
  # end
end