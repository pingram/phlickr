# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

guest = User.create!(username: 'guest', password_digest: 'n/a', fname: 'Guest', lname: 'User')
User.create!(username: 'user2', password_digest: 'n/a', fname: 'User2', lname: 'U2lname')

album1 = Album.create!(user_id: guest.id, name: 'My first album!', description: 'album description...')
album2 = Album.create!(user_id: guest.id, name: 'My second album!', description: 'album description2...')

photo_urls = [
  "http://fc09.deviantart.net/fs71/i/2012/230/b/e/grassy_field_sunset___free_stock_by_kevron2001-d5blgkr.jpg",
  "http://www.techiemania.com/wp-content/uploads/2010/09/freebie-images-free-stock-images-plugin.jpg",
  "http://ethicsalarms.files.wordpress.com/2012/03/beautiful-2ddrawings-2d41.jpg",
  "http://www.wallsave.com/wallpapers/1024x640/smooking/34363/smooking-free-stock-p-os-images-part-34363.jpg",
  "http://static1.businessinsider.com/image/50185063eab8ea6802000002/apple-ceo-tim-cook-likes-these-7-beautiful-things.jpg",
]

photo_urls.each_with_index do |photo_url, i|
  new_photo = album1.photos.build(
    user_id: 1,
    description: "stock photo number #{i + 1}",
    url: photo_url)
  new_photo.save!
end

new_photo = album2.photos.build(
  user_id: 1,
  description: "stock photo number #???",
  url: "http://been-seen.com/wp-content/uploads/Cool-Tent-Designs-We-Love-Main.jpg")
new_photo.save!

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