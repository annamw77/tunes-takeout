require 'rspotify'

class SpotifyItem
  attr_reader :item_id, :type, :name, :url, :image_url

  PLACEHOLDER_IMG_URL = "http://clipartix.com/wp-content/uploads/2016/04/Music-notes-musical-notes-clip-art-free-music-note-clipart-image-1.jpeg"

  def initialize(data)
    @item_id = data.id
    @type = data.type
    @name = data.name
    @url = data.external_urls.values[0]
    @image_url =
      if data.type == "track" && data.album.images.present?
        data.album.images[0]["url"]
      else
        PLACEHOLDER_IMG_URL
      end

      if (data.type == "album" || data.type == "artist") && data.images.any?
        raise
        data.images[0]["url"]
      else
        raise
        PLACEHOLDER_IMG_URL
      end
  end

  def self.find(music_type,music_id)
    if music_type == "track"
      data = RSpotify::Track.find(music_id)
    elsif music_type == "album"
      data = RSpotify::Album.find(music_id)
    elsif music_type == "artist"
      data = RSpotify::Artist.find(music_id)
    end
    self.new(data)
  end

end
