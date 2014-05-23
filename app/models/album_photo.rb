# == Schema Information
#
# Table name: album_photos
#
#  id         :integer          not null, primary key
#  photo_id   :integer          not null
#  album_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class AlbumPhoto < ActiveRecord::Base
  validates :photo, :album, presence: true

  belongs_to :photo, inverse_of: :album_photos
  belongs_to :album, inverse_of: :album_photos
end
