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

  def self.find(id)
    if music_type == "track"
      data = RSpotify::Track.find('music_id')
    elsif music_type == "album"
      data = RSpotify::Album.find('music_id')
    elsif music_type == "artist"
      data = RSpotify::Artist.find('music_id')
    elsif music_type == "playlist"
      data = RSpotify::Playlist.find('useridgoeshereBROKEN', 'music_id')
    end

    self.new(data)
  end

end
