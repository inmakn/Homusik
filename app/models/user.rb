class User < ActiveRecord::Base
  has_secure_password

  has_many :ratios, dependent: :destroy

  validates :username, :lastfm_username, :photo_url, :city, presence: true
  validates :username, :lastfm_username, uniqueness: true
end
