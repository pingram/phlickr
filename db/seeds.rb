# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def seed_image(file_name)
  File.open(File.join(Rails.root, "/app/assets/images/seed/#{file_name}.jpg"))
end

guest = User.create!(username: 'guest', password_digest: 'n/a', fname: 'Guest', lname: 'User')
User.create!(username: 'user2', password_digest: 'n/a', fname: 'User2', lname: 'U2lname')

album1 = Album.create!(user_id: guest.id, name: 'My first album!', description: 'album description...')
album2 = Album.create!(user_id: guest.id, name: 'My second album!', description: 'album description2...')


photo_urls = []
seed_image_path = Rails.root.join("app/assets/images/seed")
general_seed_path = seed_image_path.join("general")
Dir.entries(general_seed_path).each do |item|
  next if item == '.' or item == '..'
  photo_urls << "#{general_seed_path + item}"
end

photo_urls.each_with_index do |photo_url, i|
  new_photo = album1.photos.build(
    user_id: 1,
    description: "stock photo number #{i + 1}",
    file: File.open(photo_url))
  new_photo.save!
end

# profile pic
prof_pic1 = Photo.create!(
  user_id: 1,
  description: 'prof pic',
  url: 'https://lh6.googleusercontent.com/-hG6KKKpZu5I/AAAAAAAAAAI/AAAAAAAAAAQ/w8Rn1YcX9A8/photo.jpg')

guest.profile_photo_id = prof_pic1.id
guest.save!

Photo.create!(
    user_id: 2,
    description: "stock photo for user 2",
    url: photo_urls[0])