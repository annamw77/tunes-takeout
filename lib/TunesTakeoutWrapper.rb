require 'httparty'

# TunesTakeoutWrapper:
# Wraps interactions with the Tunes & Takeout API
# by leveraging the HTTParty gem.

class TunesTakeoutWrapper
  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"
  attr_reader :suggestion

  def initialize(data)
    all_suggestions = data["suggestions"]
    @suggestion = all_suggestions[rand(0..all_suggestions.length)]
  end

  def self.find(item)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{item}/").parsed_response
    self.new(data)
  end

end
