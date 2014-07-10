class Ratio < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :lastfm_username_entry, :city_entry, :country_entry, :user_id
end
