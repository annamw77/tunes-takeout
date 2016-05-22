require 'TunesTakeoutWrapper'
require 'Spotifyitem'
require 'Fooditem'

class SuggestionsController < ApplicationController

  def index
    if params["search_term"].present?
      search_term = params["search_term"]
      pairing = TunesTakeoutWrapper.find(search_term)
        if pairing.class == String
          session[:message] = pairing
        else
          @suggestion_id = pairing.id
          @music_search = SpotifyItem.find(pairing.music_type,pairing.music_id)
          @food_search = FoodItem.find(pairing.food_id)
        end
    end
    @top20 = TunesTakeoutWrapper.top

    if session[:user_id].present?
      @user = User.find(session[:user_id])
    end

  end

  def favorites
    user = User.find(session[:user_id])
    user_id = user.uid
    @favorites = TunesTakeoutWrapper.get_favorites(user_id)
  end

  def favorite
    user = User.find(session[:user_id])
    user_id = user.uid
    suggestion_id = params["suggestion_id"]
    favorite = TunesTakeoutWrapper.favorite(user_id,suggestion_id)

    if favorite == 201
      session[:message] = "That suggestion is now favorited!"
    elsif favorite == 409
      session[:message] = "That suggestion has been favorited already."
    elsif favorite == 404
      session[:message] = "Sorry - I couldn't find that suggestion."
    else
      session[:message] = "Sorry - I'm broken."
    end

    redirect_to :back
  end

  def unfavorite
    user = User.find(session[:user_id])
    user_id = user.uid
    suggestion_id = params["suggestion_id"]
    favorite = TunesTakeoutWrapper.unfavorite(user_id,suggestion_id)

    if favorite == 204
      session[:message] = "That suggestion is now unfavorited."
    elsif favorite == 404
      session[:message] = "Sorry - I couldn't find that suggestion."
    else
      session[:message] = "Sorry - I'm broken."
    end

    redirect_to :back
  end

end
