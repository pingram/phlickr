# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  user_id     :integer          not null
#  name        :string(255)      not null
#  description :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

class Album < ActiveRecord::Base
  validates :user_id, :name, presence: true

  has_many :albumphotos
  has_many :photos, through: :albumphotos
end
