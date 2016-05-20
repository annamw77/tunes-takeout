require 'TunesTakeoutWrapper'
require 'Spotifyitem'
require 'Fooditem'

class SuggestionsController < ApplicationController

  def index
    if params["search_term"].present?
      search_term = params["search_term"]
      pairing = TunesTakeoutWrapper.find(search_term)
      @suggestion_id = pairing.id
      @music_search = SpotifyItem.find(pairing.music_type,pairing.music_id)
      @food_search = FoodItem.find(pairing.food_id)
    end

    @top20 = TunesTakeoutWrapper.top

    if session[:user_id].present?
      @user = User.find(session[:user_id])
    end

  end

  def favorites
  end

  def favorite
    user = User.find(session[:user_id])
    user_id = user.id
    suggestion_id = params["suggestion_id"]
    TunesTakeoutWrapper.favorite(user_id,suggestion_id)
  end

  def unfavorite
  end

end
