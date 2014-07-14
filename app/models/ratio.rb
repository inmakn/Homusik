class Ratio < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :lastfm_username, :city, :country, :user_id

  def info
    "the sync ratio between last.fm user #{lastfm_username} and #{city}, #{country} is #{ratio_output}% (at #{created_at})."
  end
end
