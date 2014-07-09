class Ratio < ActiveRecord::Base
  belongs_to :user

  validates :lastfm_username_entry, :city_entry, :country_entry, :user, presence: true
end
