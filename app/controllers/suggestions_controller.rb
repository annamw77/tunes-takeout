require 'TunesTakeoutWrapper'
require 'spotifyitem.rb'

class SuggestionsController < ActionController::Base

  def index
    if params["search_term"].present?
      search_term = params["search_term"]
      @pairing = TunesTakeoutWrapper.find(search_term)
      @music_suggestion = SpotifyItem.find(@pairing.music_type,@pairing.music_id)
    end
  end

  def favorites
  end

  def favorite
  end

  def unfavorite
  end

end
