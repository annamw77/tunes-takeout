require 'httparty'
require 'json'

class TunesTakeoutWrapper
  attr_reader :id, :food_id, :music_id, :music_type

  BASE_URL = "https://tunes-takeout-api.herokuapp.com/"

  def initialize(data)
    @id = data["suggestion"]["id"]
    @food_id = data["suggestion"]["food_id"]
    @music_id = data["suggestion"]["music_id"]
    @music_type = data["suggestion"]["music_type"]
  end

  def self.find(item)
    data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=#{item}&limit=1/").parsed_response
    data["suggestion"] = data.delete("suggestions")
    data["suggestion"] = data["suggestion"][0]

    if data["suggestion"].nil?
      return @message = "Sorry, we couldn't find a good suggestion."
    end

    self.new(data)
  end

  data = HTTParty.get(BASE_URL + "/v1/suggestions/search?query=banana&limit=1/").parsed_response


  def self.top
    data = HTTParty.get(BASE_URL + "/v1/suggestions/top").parsed_response
    #returns a hash
    #look through array of ids and turn them into an array of Wrapper instances
    suggestion_pairings = []
    data["suggestions"].each do |suggestion|
      suggestion_pairings << HTTParty.get(BASE_URL + "/v1/suggestions/#{suggestion}").parsed_response
    end

    suggestion_instances = []
    suggestion_pairings.each do |pairing|
      suggestion_instances << self.new(pairing)
    end

    return suggestion_instances
  end

  def self.favorite(user_id,suggestion_id)
      response = HTTParty.post(BASE_URL + "/v1/users/#{user_id}/favorites", body: {"suggestion": suggestion_id}.to_json)
      return response.code
  end

  def self.unfavorite(user_id,suggestion_id)
      response = HTTParty.delete(BASE_URL + "/v1/users/#{user_id}/favorites", body: {"suggestion": suggestion_id}.to_json)
      return response.code
  end

  def self.get_favorites(user_id)
    data = HTTParty.get(BASE_URL + "/v1/users/#{user_id}/favorites").parsed_response

    suggestion_pairings = []
    data["suggestions"].each do |suggestion|
      suggestion_pairings << HTTParty.get(BASE_URL + "/v1/suggestions/#{suggestion}").parsed_response
    end

    suggestion_instances = []
    suggestion_pairings.each do |pairing|
      suggestion_instances << self.new(pairing)
    end

    return suggestion_instances
  end

  def self.check_for_favorites(user_id)
    data = HTTParty.get(BASE_URL + "/v1/users/#{user_id}/favorites").parsed_response
    data["suggestions"]
  end

end
