User.create!([
  {username: "dmazza", password_digest: "n/a", session_token: "qTmJNHEjgKxTzxfh-Vk_3g", fname: "Dani", lname: "Mazza", profile_photo_id: 1},
  {username: "Jamie In Bytown", password_digest: "asdfasdf", session_token: "I0fWTgSfH_qafdzm7HhSmA", fname: "Jamie", lname: "McCaffrey", profile_photo_id: nil},
  {username: "Danny VB", password_digest: "asdfasdf", session_token: "8BG5Zg0gdUvadTEVMeywDg", fname: nil, lname: nil, profile_photo_id: nil},
  {username: "Michael Brandt Photography", password_digest: "asdfasdf", session_token: "QyJvEJWNU2uPoBN8PoF--g", fname: "Michael", lname: "Brandt", profile_photo_id: nil},
  {username: "m.gregory91", password_digest: "asdfasdf", session_token: "Y6w-y28Ej2y5zGiaeSGiUQ", fname: "Michael", lname: "Gregory", profile_photo_id: nil},
  {username: "Tucapel", password_digest: "asdfasdf", session_token: "YaUbpBeGJn-ctxi-mDM2dA", fname: nil, lname: nil, profile_photo_id: nil},
  {username: "kkirby864", password_digest: "asdfasdf", session_token: "v-UdOS5r2pP5lPEP_pRA_g", fname: "Karen", lname: "Kirby", profile_photo_id: nil},
  {username: "finistere", password_digest: "asdfasdf", session_token: "dp30GDPAhMbSTglwHqJ3wA", fname: "Michael", lname: "Artz", profile_photo_id: nil},
  {username: "hsun", password_digest: "n/a", session_token: "nU19CMjfdL-BBuyhiuu4pw", fname: "Hahnbi", lname: "Sun", profile_photo_id: nil}
])
Album.create!([
  {user_id: 1, name: "cityscapes", description: "stills of the great  cities of the world"},
  {user_id: 1, name: "the great outdoors", description: "album description2..."},
  {user_id: 2, name: "Hahnbi's first album", description: "album description3..."}
])
Photo.create!([
  {user_id: 1, description: "my profile picture", url: "https://lh6.googleusercontent.com/-hG6KKKpZu5I/AAAAAAAAAAI/AAAAAAAAAAQ/w8Rn1YcX9A8/photo.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 2, description: "Barn in the mountains", url: "https://farm4.staticflickr.com/3701/14250671936_d7e582e811_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 4, description: "Walking to the Rocher Percé. Gaspésie. #1", url: "https://farm6.staticflickr.com/5528/14087246028_8bcef0274b_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 3, description: "Kayaking in the clouds.", url: "https://farm4.staticflickr.com/3740/14276682652_e3927c2729_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 5, description: "Kerry Park Moonrise", url: "https://farm3.staticflickr.com/2901/14277653074_438d452106_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 2, description: "City That Never Sleeps", url: "https://farm6.staticflickr.com/5235/14295537173_dbc08a7451_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 6, description: "Let Sleeping Owls Lie", url: "https://farm4.staticflickr.com/3733/14273811504_70e8b44fab_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 7, description: "sunset - Powell Point - Grand Canyon - 5-09-14  01", url: "https://farm3.staticflickr.com/2929/14272300182_1c2a7abdd3_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 8, description: "Sticks and Stones...", url: "https://farm6.staticflickr.com/5594/14270932402_ac259f23d2_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 9, description: "Kitty Portrait", url: "https://farm4.staticflickr.com/3750/14273400454_90fe2c5020_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Entrance to another World .....", url: "https://farm3.staticflickr.com/2909/14301641103_01bd21aa09_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Swedish Royal Castle shot from Skeppsholmen (Stockholm)", url: "https://farm6.staticflickr.com/5491/14097130247_ab25b41b44_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "un sogno ricorrente - a recurring dream", url: "https://farm3.staticflickr.com/2896/14094879910_b02fa8f727_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Blue lake", url: "http://www.wallsave.com/wallpapers/1024x640/smooking/34363/smooking-free-stock-p-os-images-part-34363.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Kids at Play", url: "https://farm4.staticflickr.com/3720/14283762224_74f78d9e7e_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Follow the Willow Road", url: "https://farm4.staticflickr.com/3668/14282863671_a8d25598ae_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "JRG+JRB", url: "https://farm4.staticflickr.com/3785/14096661038_22efebe5a6_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Vegas", url: "https://farm6.staticflickr.com/5312/14285015905_2749114ebe_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "10.22am sunday, this is why i get up early, to avoid the rush", url: "https://farm4.staticflickr.com/3713/14259181396_889d7ac369_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Selfoss Iceland", url: "https://farm6.staticflickr.com/5114/14098937919_c0f192aa8d_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "Taxi Omotesando", url: "https://farm6.staticflickr.com/5538/14281097251_5d20a93c87_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil},
  {user_id: 1, description: "San Pietro", url: "https://farm3.staticflickr.com/2926/14099696077_1e8a146b17_b.jpg", file_file_name: nil, file_content_type: nil, file_file_size: nil, file_updated_at: nil, o_width: nil, o_height: nil, display_width: nil, display_height: nil}
])
AlbumPhoto.create!([
  {photo_id: 11, album_id: 1},
  {photo_id: 12, album_id: 1},
  {photo_id: 13, album_id: 1},
  {photo_id: 16, album_id: 2},
  {photo_id: 17, album_id: 1},
  {photo_id: 18, album_id: 1},
  {photo_id: 19, album_id: 1},
  {photo_id: 21, album_id: 1},
  {photo_id: 2, album_id: 3}
])
FavoritePhoto.create!([
  {user_id: 1, photo_id: 2},
  {user_id: 1, photo_id: 3},
  {user_id: 1, photo_id: 4},
  {user_id: 1, photo_id: 5},
  {user_id: 1, photo_id: 6},
  {user_id: 1, photo_id: 7},
  {user_id: 1, photo_id: 8},
  {user_id: 1, photo_id: 9},
  {user_id: 1, photo_id: 10}
])