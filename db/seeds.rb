User.create!([
  {username: "guest", password_digest: "n/a", session_token: "3pAYjFXzDIyfTQuAlmcT2Q", fname: "Guest", lname: "User", profile_photo_id: 1},
  {username: "hsun", password_digest: "n/a", session_token: "nU19CMjfdL-BBuyhiuu4pw", fname: "Hahnbi", lname: "Sun", profile_photo_id: nil},
  {username: "Jamie In Bytown", password_digest: "asdfasdf", session_token: "I0fWTgSfH_qafdzm7HhSmA", fname: "Jamie", lname: "McCaffrey", profile_photo_id: nil},
  {username: "Danny VB", password_digest: "asdfasdf", session_token: "8BG5Zg0gdUvadTEVMeywDg", fname: nil, lname: nil, profile_photo_id: nil},
  {username: "Michael Brandt Photography", password_digest: "asdfasdf", session_token: "QyJvEJWNU2uPoBN8PoF--g", fname: "Michael", lname: "Brandt", profile_photo_id: nil},
  {username: "m.gregory91", password_digest: "asdfasdf", session_token: "Y6w-y28Ej2y5zGiaeSGiUQ", fname: "Michael", lname: "Gregory", profile_photo_id: nil},
  {username: "Tucapel", password_digest: "asdfasdf", session_token: "YaUbpBeGJn-ctxi-mDM2dA", fname: nil, lname: nil, profile_photo_id: nil},
  {username: "kkirby864", password_digest: "asdfasdf", session_token: "v-UdOS5r2pP5lPEP_pRA_g", fname: "Karen", lname: "Kirby", profile_photo_id: nil},
  {username: "finistere", password_digest: "asdfasdf", session_token: "dp30GDPAhMbSTglwHqJ3wA", fname: "Michael", lname: "Artz", profile_photo_id: nil}
])

Album.create!([
  {user_id: 1, name: "My first album!", description: "album description..."},
  {user_id: 1, name: "My second album!", description: "album description2..."},
  {user_id: 2, name: "Hahnbi's first album", description: "album description3..."}
])

Photo.create!([
  {user_id: 1, description: "my profile picture", url: "https://lh6.googleusercontent.com/-hG6KKKpZu5I/AAAAAAAAAAI/AAAAAAAAAAQ/w8Rn1YcX9A8/photo.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Blue lake", url: "http://www.wallsave.com/wallpapers/1024x640/smooking/34363/smooking-free-stock-p-os-images-part-34363.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 2, description: "Barn in the mountains", url: "https://farm4.staticflickr.com/3701/14250671936_d7e582e811_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 4, description: "Walking to the Rocher Percé. Gaspésie. #1", url: "https://farm6.staticflickr.com/5528/14087246028_8bcef0274b_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 3, description: "Kayaking in the clouds.", url: "https://farm4.staticflickr.com/3740/14276682652_e3927c2729_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 5, description: "Kerry Park Moonrise", url: "https://farm3.staticflickr.com/2901/14277653074_438d452106_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 2, description: "City That Never Sleeps", url: "https://farm6.staticflickr.com/5235/14295537173_dbc08a7451_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 6, description: "Let Sleeping Owls Lie", url: "https://farm4.staticflickr.com/3733/14273811504_70e8b44fab_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 7, description: "sunset - Powell Point - Grand Canyon - 5-09-14  01", url: "https://farm3.staticflickr.com/2929/14272300182_1c2a7abdd3_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 8, description: "Sticks and Stones...", url: "https://farm6.staticflickr.com/5594/14270932402_ac259f23d2_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 9, description: "Kitty Portrait", url: "https://farm4.staticflickr.com/3750/14273400454_90fe2c5020_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil}
])

# AlbumPhoto.create!([
#   {photo_id: 1, album_id: 1},
#   {photo_id: 2, album_id: 1},
#   {photo_id: 3, album_id: 1},
#   {photo_id: 4, album_id: 1},
#   {photo_id: 5, album_id: 1},
#   {photo_id: 6, album_id: 2},
#   {photo_id: 7, album_id: 3},
#   {photo_id: 8, album_id: 3},
#   {photo_id: 9, album_id: 3},
#   {photo_id: 10, album_id: 3}
# ])

(3..11).each do |i|
  FavoritePhoto.create!(user_id: 1, photo_id: i)
end