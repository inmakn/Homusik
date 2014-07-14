class Ratio < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :lastfm_username, :city, :country, :user_id

  def info
    "the sync ratio between last.fm user #{@ratio.lastfm_username} and #{@ratio.city}, #{@ratio.country} is #{@ratio.ratio_output}% (at #{@ratio.created_at})."
  end
end
