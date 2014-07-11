class Lastfm

  API_KEY = "0d96d6cb18193df7a265dece97b07459"
  LASTFM_URL = "http://ws.audioscrobbler.com/2.0/"

  #List of cities and countries for search
  def self.countries
    country_array = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetros&api_key=#{API_KEY}&format=json"))["metros"]["metro"].map do |metro|
      metro["country"]
    end
    country_array.uniq!
  end

  # def self.cities(country)
  #   city_array = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetros&country=#{country}&api_key=#{API_KEY}&format=json"))["metros"]["metro"].map do |metro|
  #     metro["name"]
  #   end
  # end

  def self.cities
    city_array = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetros&&api_key=#{API_KEY}&format=json"))["metros"]["metro"].map do |metro|
      metro["name"]
    end
  end

  #get metro's array of track/artist pairs by country, city
  def self.metro_list(city, country)
    metro_array = []
    metro_call = HTTParty.get(URI.escape("#{LASTFM_URL}?method=geo.getmetrohypetrackchart&country=#{country}&metro=#{city}&api_key=#{API_KEY}&format=json"))["toptracks"]["track"].each do |track_hash|
      metro_array << {title: track_hash["name"], artist: track_hash["artist"]["name"]}
    end
    return metro_array
  end

  #get user's array of track/artist pairs by username
  def self.user_list(username)
    user_array = []
    user_call = HTTParty.get(URI.escape("#{LASTFM_URL}?method=user.getweeklytrackchart&user=#{username}&api_key=#{API_KEY}&format=json"))
    if user_call.include?("error")
      return user_array
    else
      user_call["weeklytrackchart"]["track"].each do |track_hash|
        user_array << {title: track_hash["name"], artist: track_hash["artist"]["#text"]}
      end
      return user_array
    end
  end

end
