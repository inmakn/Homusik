class Ratio < ActiveRecord::Base
  belongs_to :user

  validates :lastfm_username_entry, :city_entry, :country_entry, :ratio_output, :user, presence: true
end
