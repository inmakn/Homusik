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

  #get metro's array of track/artist pairs by country, city
  #defaults to an 8 week span, with 300 results in one page

  def self.metro_list(city, country)
    metro_week_call = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetroweeklychartlist&api_key=#{ENV["API_KEY"]}&format=json&metro=#{city}"))
    metro_start_date = metro_week_call['weeklychartlist']['chart'][1]['from']
    metro_end_date = metro_week_call['weeklychartlist']['chart'][8]['to']
    limit = 300
    metro_array = []
    metro_call = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetrohypetrackchart&country=#{country}&metro=#{city}&api_key=#{ENV["API_KEY"]}&format=json&from=#{metro_start_date}&to=#{metro_end_date}&limit=#{limit}"))
    metro_call["toptracks"]["track"].each do |track_hash|
      metro_array << {title: track_hash["name"], artist: track_hash["artist"]["name"]}
    end
    return metro_array
  end

  #get user's array of track/artist pairs by username
  def self.user_list(username)
    user_array = []
    user_call = HTTParty.get(URI.escape("#{LASTFM_URL}?method=user.getweeklytrackchart&user=#{username}&api_key=#{ENV["API_KEY"]}&format=json"))
    if user_call["weeklytrackchart"]
      if user_call["weeklytrackchart"].include?("track")
      user_call["weeklytrackchart"]["track"].each do |track_hash|
        user_array << {title: track_hash["name"], artist: track_hash["artist"]["#text"]}
      end
      return user_array
      else
      return user_array
      end
    else
      return user_array
    end
  end

  #calculate percent of user's tracklist shared with metro tracklist
  def calculate_ratio(metro_array, user_array)

  end

end
