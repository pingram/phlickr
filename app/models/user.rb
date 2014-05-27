# == Schema Information
#
# Table name: users
#
#  id               :integer          not null, primary key
#  username         :string(255)      not null
#  password_digest  :string(255)      not null
#  session_token    :string(255)      not null
#  created_at       :datetime
#  updated_at       :datetime
#  fname            :string(255)
#  lname            :string(255)
#  profile_photo_id :integer
#

class User < ActiveRecord::Base
  attr_reader :password
  validates :username, :password_digest, presence: true
  validates :password, :length => { :minimum => 6, :allow_nil => true }
  validates :session_token, :presence => true, :uniqueness => true
  validates :username, uniqueness: true

  before_validation :ensure_session_token

  has_many :photos
  has_many :albums
  has_many :favorite_photos
  has_many :favorited_photos, through: :favorite_photos, source: :photo
  belongs_to :profile_photo,
    class_name: "Photo",
    foreign_key: :profile_photo_id,
    primary_key: :id

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private
  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
