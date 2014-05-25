json.id           photo.id
json.description  photo.description
json.url          photo.url || photo.file.url(:original)
json.user_id      photo.user_id