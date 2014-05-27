# == Schema Information
#
# Table name: photos
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  description       :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  url               :string(255)
#  file_file_name    :string(255)
#  file_content_type :string(255)
#  file_file_size    :integer
#  file_updated_at   :datetime
#  o_width           :integer
#  o_height          :integer
#  display_width     :integer
#  display_height    :integer
#

class Photo < ActiveRecord::Base

  validates :user_id, presence: true

  belongs_to :user
  has_many :album_photos, inverse_of: :photo
  has_many :albums, through: :album_photos, source: :album, inverse_of: :photos
  has_many :favorite_photos
  has_many :users_who_favorited, through: :favorite_photos, source: :user

  # This method associates the attribute ":_photo" with a file attachment
  has_attached_file :file, {
    styles: {
      original: '2400x1800>',
      large: '1024x768>',
      medium: '500x375>',
      large_square: '150x150!'
    },
    s3_headers: { "Cache-Control" => "max-age=315576000", "Expires" => 10.years.from_now.httpdate }
  }


  # Validate the attached image is image/jpg, image/png, etc
  # TODO: come back
  # validates_attachment_content_type :_photo, :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
end
