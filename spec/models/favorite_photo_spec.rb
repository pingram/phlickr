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

require 'spec_helper'

describe FavoritePhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
