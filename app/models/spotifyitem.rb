require 'rspotify'

class SpotifyItem
  attr_reader :item_id, :type, :name, :url, :image_url

  def initialize(data)
    @item_id = data.id
    @type = data.type
    @name = data.name
    @url = data.external_urls.values[0]
    @image_url =
      if data.images.present? && data.type == "track"
        data.album.images[0]["url"]
      end

      if data.images.present? && (data.type == "album" || data.type == "artist")
        data.images[0]["url"]
      end

      if data.images.present? == false
        "https://c1.staticflickr.com/1/186/382004453_f4b2772254.jpg"
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
