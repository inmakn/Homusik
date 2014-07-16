require 'rails_helper'

describe Ratio do

  it { is_expected.to validate_presence_of(:lastfm_username)}
  it { is_expected.to validate_presence_of(:city)}
  it { is_expected.to validate_presence_of(:country)}
  it { is_expected.to validate_presence_of(:user_id)}

  it { is_expected.to belong_to(:user)}

  it "returns has an info string including the username, city, country, and ratio" do
    ratio = Ratio.create(lastfm_username: "fen", city: "seattle", country: "USA")
    info = ratio.info.downcase
    expect(info).to include("fen")
    expect(info).to include("seattle")
    expect(info).to include("usa")
  end

end
