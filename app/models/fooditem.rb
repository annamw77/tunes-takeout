require 'yelp'

class FoodItem

  CLIENT = Yelp::Client.new({ consumer_key: ENV["YELP_CONSUMER_KEY"],
                              consumer_secret: ENV["YELP_CONSUMER_SECRET"],
                              token: ENV["YELP_TOKEN"],
                              token_secret: ENV["YELP_TOKEN_SECRET"]
                            })

  attr_reader :business_id, :name, :url, :image_url, :phone, :rating

  def initialize(data)
    @business_id = data.business.id
    @name = data.business.name
    @url = data.business.url
    @image_url = data.business.image_url
    @phone = data.business.phone
    @rating = data.business.rating
  end

  def self.find(food_id)
    data = CLIENT.business(food_id)
    self.new(data)
  end

end
