class User < ActiveRecord::Base
  has_secure_password

  has_many :ratios, dependent: :destroy

  validates_presence_of :username, :lastfm_username, :photo_url, :city, :country
  validates_uniqueness_of :username, :lastfm_username
end
