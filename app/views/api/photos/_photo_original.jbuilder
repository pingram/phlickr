json.id           photo.id
json.description  photo.description
json.url          photo.url || photo.file.url(:original)
json.created_at   photo.created_at
json.user_id      photo.user_id