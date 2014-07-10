require 'rails_helper'

describe Ratio do

  it { is_expected.to validate_presence_of (:lastfm_username_entry)}
  it { is_expected.to validate_presence_of (:city_entry)}
  it { is_expected.to validate_presence_of (:country_entry)}
  it { is_expected.to validate_presence_of (:user_id)}

end
