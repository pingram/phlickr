json.extract! user, :id, :username, :fname, :lname, :created_at, :updated_at
json.profile_photo @user.profile_photo
json.photos @user.photos.order(:id), partial: 'api/photos/photo', as: :photo