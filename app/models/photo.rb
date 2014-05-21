# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Photo < ActiveRecord::Base
  validates :user_id, presence: true
end
