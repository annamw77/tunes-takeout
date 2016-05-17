require 'httparty'
require 'rspotify'

class SpotifyItem
  attr_reader :item_id, :type, :name, :url, :image_url

  def initialize(data)
    @item_id = data.id
    @type = data.type
    @name = data.name
    @url = data.external_urls.values[0] #extracts string of url
    @image_url = data.images[0]["url"] #extracts string of img that is 640 hgt
  end

  # "music_id":"1WGWUsR3u4DpQEaE8zWwcr",
  # "music_type":"artist"
  # RSpotify::Artist.find('1WGWUsR3u4DpQEaE8zWwcr')
  # data = HTTParty.get("https://api.spotify.com/v1/artists/1WGWUsR3u4DpQEaE8zWwcr").parsed_response
# HTTParty.get("https://tunes-takeout-api.herokuapp.com/v1/suggestions/search?query=banana").parsed_response

# response["suggestions"][rand(0..10)]
# response["suggestions"].length = 10,
# response["suggestions"][0]
# response["suggestions"][0]["id"]
# response["suggestions"][0]["food_id"]
# response["suggestions"][0]["music_id"]
# response["suggestions"][0]["music_type"]

  def self.find(id)

    # track, albumn, artist, playlist
      # /v1/albums/{id}
      # /v1/tracks/{id}
      # /v1/artists/{id}
      # /v1/users/{user_id}/playlists/{playlist_id}
        #what would user id be???
    self.new(data)
  end

end
