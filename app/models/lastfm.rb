class Lastfm

  LASTFM_URL = "http://ws.audioscrobbler.com/2.0/"

  #List of cities and countries for search
  def self.countries
    country_array = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetros&api_key=#{ENV["API_KEY"]}&format=json"))["metros"]["metro"].map do |metro|
      metro["country"]
    end
    country_array.uniq!
  end

  def self.cities
    city_array = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetros&&api_key=#{ENV["API_KEY"]}&format=json"))["metros"]["metro"].map do |metro|
      metro["name"]
    end
  end

  #get metro's array of track/artist pairs by city, country.
  #returns an empty array if track info is not available for that city
  #return an array containing an error message if passed an invalid city/country pair
  #defaults to up to 500 results per call
  def self.metro_list(city, country)
    metro_track_array = []
    limit = 500
    metro_call = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.gettoptracks&country=#{country}&api_key=#{ENV["API_KEY"]}&format=json&location=#{city}&limit=#{limit}"))
    if metro_call["toptracks"]
      if metro_call["toptracks"].include?("track")
        metro_call["toptracks"]["track"].each do |track_hash|
          metro_track_array << {title: track_hash["name"], artist: track_hash["artist"]["name"]}
        end
        return metro_track_array
      else
        return metro_track_array
      end
    elsif metro_call["error"]
      error_array = []
      error_array << metro_call["error"]
      return error_array
    else
      return metro_track_array
    end
  end


  #get user's array of track/artist pairs by username
  #returns an empty array if track info is not available for that user
  #defaults to up to 500 results per call
  def self.user_list(username)
    user_track_array = []
    limit = 500
    user_call = HTTParty.get(URI.escape("#{LASTFM_URL}?method=user.gettoptracks&user=#{username}&api_key=#{ENV["API_KEY"]}&format=json&limit=#{limit}"))
    if user_call["toptracks"]
      if user_call["toptracks"].include?("track")
        user_call["toptracks"]["track"].each do |track_hash|
          user_track_array << {title: track_hash["name"], artist: track_hash["artist"]["name"]}
        end
        return user_track_array
      else
        return user_track_array
      end
    else
      return user_track_array
    end
  end

  #create new array of tracks shared by user and metro tracklists
  def self.get_common_tracks(metro_list_array, user_list_array)
    if metro_list_array.include?(6)
      common_track_array = ["whoops, that city doesn't belong in that country!"]
    else
      common_track_array = metro_list_array & user_list_array
    end
  end

  #calculate percent of user's tracklist shared with metro tracklist
  def self.calculate_ratio(common_track_array, user_list_array)
    if common_track_array.include?("whoops, that city doesn't belong in that country!")
      ratio = ["invalid city/country combination"]
    else
      ratio = common_track_array.length*100 / user_list_array.length.to_f
    end
  end

  #method to get ratio from three initial attributes
  def self.get_final_ratio(city, country, lastfm_username)
    final_ratio = Lastfm.calculate_ratio(Lastfm.get_common_tracks(Lastfm.metro_list(city, country), Lastfm.user_list(lastfm_username)), Lastfm.user_list(lastfm_username))
  end


end
