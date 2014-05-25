json.id           album.id
json.user_id      album.user_id
json.name         album.name
json.description  album.description

json.photos @album.photos, partial: 'api/photos/photo', as: :photo