require 'rspotify'

class SpotifyItem
  attr_reader :item_id, :type, :name, :url, :image_url

  def initialize(data)
    @item_id = data.id
    @type = data.type
    @name = data.name
    @url = data.external_urls.values[0] #extracts string of url
    # @image_url = data.images[0]["url"] ||= nil #extracts string of img that is 640 hgt
    #image needs reworking, doesnt work for tracks. has different pathing.
  end

  def self.find(music_type,music_id)
    if music_type == "track"
      data = RSpotify::Track.find('music_id')
    elsif music_type == "album"
      data = RSpotify::Album.find('music_id')
    elsif music_type == "artist"
      data = RSpotify::Artist.find('music_id')
    end

    self.new(data)
  end

end
