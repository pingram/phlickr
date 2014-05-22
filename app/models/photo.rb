# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  url         :string(255)
#

class Photo < ActiveRecord::Base
  validates :user_id, presence: true

  belongs_to :user
end
