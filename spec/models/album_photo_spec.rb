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

require 'spec_helper'

describe AlbumPhoto do
  pending "add some examples to (or delete) #{__FILE__}"
end
