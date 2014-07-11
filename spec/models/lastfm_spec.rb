require 'rails_helper'

describe Lastfm do
  let(:results) { Lastfm.metro_list("seattle", "united states") }

  describe "tracklists for metro areas (.metro_list)" do
    it "returns an array when given a valid city and country" do
      expect(results).to be_an(Array)
    end

    it "returns an array of hashes when given a valid city and country" do
      expect(results.first).to be_a(Hash)
      expect(results.last).to be_a(Hash)
    end

    it "returns hashes which have a title and artist" do
      expect(results.first[:title]).to be_a(String)
      expect(results.first[:artist]).to be_a(String)
    end
  end

  describe "tracklists for users (.user_list)" do
    it "returns an empty array when an invalid username is given" do
      results = Lastfm.user_list("aasdlkasnldkfndfdnfdifsdisidsfinfknsvxvcx")
      expect(results).to eq([])
    end

    it "returns an empty array when no username is given" do
      results = Lastfm.user_list(nil)
      expect(results).to eq([])
    end
  end

end
