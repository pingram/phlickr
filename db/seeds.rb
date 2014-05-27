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
hahnbi = User.create!(username: 'hsun', password_digest: 'n/a', fname: 'Hahnbi', lname: 'Sun')

album1 = Album.create!(user_id: guest.id, name: 'My first album!', description: 'album description...')
album2 = Album.create!(user_id: guest.id, name: 'My second album!', description: 'album description2...')
album3 = Album.create!(user_id: hahnbi.id, name: "Hahnbi's first album", description: 'album description3...')


# photo_urls = []
# seed_image_path = Rails.root.join("app/assets/images/seed")
# general_seed_path = seed_image_path.join("general")
# Dir.entries(general_seed_path).each do |item|
#   next if item == '.' or item == '..'
#   photo_urls << "#{general_seed_path + item}"
# end

photo_urls = [
  "http://fc09.deviantart.net/fs71/i/2012/230/b/e/grassy_field_sunset___free_stock_by_kevron2001-d5blgkr.jpg",
  "http://www.techiemania.com/wp-content/uploads/2010/09/freebie-images-free-stock-images-plugin.jpg",
  "http://www.wallsave.com/wallpapers/1024x640/smooking/34363/smooking-free-stock-p-os-images-part-34363.jpg",
  "http://static1.businessinsider.com/image/50185063eab8ea6802000002/apple-ceo-tim-cook-likes-these-7-beautiful-things.jpg",
  "http://been-seen.com/wp-content/uploads/Cool-Tent-Designs-We-Love-Main.jpg"
]

photo_urls2 = [
  "https://farm4.staticflickr.com/3733/14273811504_70e8b44fab_b.jpg",
  "https://farm4.staticflickr.com/3740/14276682652_e3927c2729_b.jpg",
  "https://farm4.staticflickr.com/3701/14250671936_d7e582e811_b.jpg",
  "https://farm6.staticflickr.com/5235/14295537173_dbc08a7451_b.jpg"
]

photo_urls.each_with_index do |photo_url, i|
  new_photo = album1.photos.build(
    user_id: 1,
    description: "stock photo number #{i + 1}",
    # file: File.open(photo_url))
    url: photo_url)
  new_photo.save!
end

new_photo = album2.photos.build(
  user_id: 1,
  description: "stock photo number ???",
  # file: File.open(photo_url))
  url: "http://es.flash-screen.com/free-wallpaper/enchanting-landscape-picture-hd/cool-landscape-picture-hd,1366x768,56429.jpg")
new_photo.save!

photo_urls2.each_with_index do |photo_url, i|
  new_photo = album3.photos.build(
    user_id: 2,
    description: "stock photo number #{i + 1}",
    # file: File.open(photo_url))
    url: photo_url)
  new_photo.save!
  FavoritePhoto.create!(user_id: guest.id, photo_id: new_photo.id)
end

# profile pic
prof_pic1 = Photo.create!(
  user_id: 1,
  description: 'prof pic',
  url: 'https://lh6.googleusercontent.com/-hG6KKKpZu5I/AAAAAAAAAAI/AAAAAAAAAAQ/w8Rn1YcX9A8/photo.jpg')

guest.profile_photo_id = prof_pic1.id
guest.save!

# Photo.create!(
#     user_id: 2,
#     description: "stock photo for user 2",
#     url: photo_urls[0])