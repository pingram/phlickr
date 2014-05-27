# == Schema Information
#
# Table name: favorite_photos
#
#  id         :integer          not null, primary key
#  user_id    :integer          not null
#  photo_id   :integer          not null
#  created_at :datetime
#  updated_at :datetime
#

class FavoritePhoto < ActiveRecord::Base
  belongs_to :user
  belongs_to :photo
end
