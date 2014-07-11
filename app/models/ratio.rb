class Ratio < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :lastfm_username, :city, :country, :user_id

  def info
    "last.fm user #{lastfm_username} & #{city}, #{country} => #{ratio_output}% sync ratio"
  end
end
