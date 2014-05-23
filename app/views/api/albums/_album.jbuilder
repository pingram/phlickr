json.extract! album, :id, :user_id, :name, :description
json.photos @album.photos.order(:id), partial: 'api/photos/photo', as: :photo