json.array! albums do |album|
  json.id           album.id
  json.user_id      album.user_id
  json.name         album.name
  json.description  album.description
  
  # TODO: bug if an album has no photos - use default photo with url
  json.cover_photo  do
    json.partial! album.photos.first, partial: 'photos/photo', as: :photo
  end
end