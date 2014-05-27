class Api::AlbumsController < ApplicationController
  def new
    render :new
  end

  def index
    @albums = current_user.albums
    render partial: "api/albums/albums", locals: { albums: @albums }
  end

  def show
    @album = Album.find(params[:id])
    render partial: "api/albums/album", locals: { album: @album }
  end

  def create
    photo_ids = params[:photo_ids]
    @album = current_user.albums.build(album_params)
    @album.photos = Photo.where(id: photo_ids)

    if @album.save
      render partial: "api/albums/album", locals: { album: @album }
    else
      render json: { errors: @album.errors.full_messages }, status: 422
    end
  end

  # def update
  #   @album = Album.find(params[:id])

  #   if @album.update_attributes(album_params)
  #     render partial: "api/albums/album", locals: { album: @album }
  #   else
  #     render json: { errors: @album.errors.full_messages }, status: 422
  #   end
  # end

  def destroy
    @album = current_user.albums.find(params[:id])
    @album.try(:destroy)
    render partial: "api/albums/album", locals: { album: @album }
  end

  private
  def album_params
    params.require(:album).permit(:user_id, :name, :description)
  end
end
