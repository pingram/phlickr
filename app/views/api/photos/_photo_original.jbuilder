json.id               photo.id
json.description      photo.description
json.url              photo.url || photo.file.url(:original)
json.created_at       photo.created_at
json.user_id          photo.user_id
json.current_user_id  current_user.id
json.is_favorite      current_user.favorited_photos.include?(photo)