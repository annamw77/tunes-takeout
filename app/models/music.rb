require 'httparty'
require 'rspotify'

# https://developer.spotify.com/web-api/endpoint-reference/

class SpotifyItem
  BASE_URL = "https://api.spotify.com"
  attr_reader :item_id, :type, :name, :url, :image_url

  def initialize(data)
    @item_id = data["item_id"]
    @type = data["type"]
    @name = data["name"]
    @url = data["url"]
    @image_url = data["image_url"]
  end

  def self.find(id)
    # http://pokeapi.co/api/v2/pokemon/25/
    # find a pokemon with the passed id
    data = HTTParty.get(BASE_URL + "pokemon/#{id}/").parsed_response
    # track, albumn, artist, playlist
      # /v1/albums/{id}
      # /v1/tracks/{id}
      # /v1/artists/{id}
      # /v1/users/{user_id}/playlists/{playlist_id}
        #what would user id be???
    # return an instance of pokemon for that id
    self.new(data)
  end

end
