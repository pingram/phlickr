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

  # This method associates the attribute ":_photo" with a file attachment
  has_attached_file :file,
    styles: {
      thumb: '100x100>',
      square: '200x200#',
      medium: '300x300>'
    },
    whiny: false

  # Validate the attached image is image/jpg, image/png, etc
  # TODO: come back
  # validates_attachment_content_type :_photo, :content_type => /\Aimage\/.*\Z/

  validates_attachment_content_type :file, :content_type => ['image/jpeg', 'image/png']
end
