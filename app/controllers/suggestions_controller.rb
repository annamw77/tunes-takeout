require 'TunesTakeoutWrapper'

class SuggestionsController < ActionController::Base

  def index
    if params["search_term"].present?
      search_term = params["search_term"]
      @suggestion = TunesTakeoutWrapper.find(search_term)
    end
  end

  def favorites
  end

  def favorite
  end

  def unfavorite
  end

end
