require 'rails_helper'

describe User do
  it { should validate_presence_of (:username)}
  it { should validate_presence_of (:lastfm_username)}
  it { should validate_presence_of (:photo_url)}
  it { should validate_presence_of (:city)}
  it { should validate_presence_of (:country)}

  it { should validate_uniqueness_of (:username)}
  it { should validate_uniqueness_of (:lastfm_username)}

  it {should validate_confirmation_of (:password)}

  it { should have_many(:ratios).dependent(:destroy)}
end
