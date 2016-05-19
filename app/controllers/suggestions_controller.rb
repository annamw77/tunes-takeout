require 'TunesTakeoutWrapper'
require 'Spotifyitem'
require 'Fooditem'

class SuggestionsController < ApplicationController

  def index
    if params["search_term"].present?
      search_term = params["search_term"]
      @pairing = TunesTakeoutWrapper.find(search_term)
      @music_suggestion = SpotifyItem.find(@pairing.music_type,@pairing.music_id)
      @food_suggestion = FoodItem.find(@pairing.food_id)
    end
  end

  def favorites
  end

  def favorite
  end

  def unfavorite
  end

end
