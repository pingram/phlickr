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
  validates :photo_id, :album_id, presence: true

  belongs_to :photo
  belongs_to :album
end
