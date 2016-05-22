class User < ActiveRecord::Base
  validates :name, :uid, :provider, presence: true
  validate :provider_must_be_spotify

  def self.find_or_create_from_omniauth(auth_hash)
    user = self.find_by(uid: auth_hash["uid"], provider: auth_hash["provider"], name: auth_hash["info"]["name"])
    if !user.nil?
      return user
    else
      user = User.new
      user.uid = auth_hash["uid"]
      user.provider = auth_hash["provider"]
      user.name = auth_hash["info"]["name"]
      user.img_url = auth_hash["info"].image

      if user.save
        return user
      else
        return nil
      end
    end
  end

  private

  def provider_must_be_spotify
    if provider != "spotify"
       errors.add(:provider, "must be Spotify")
    end
  end

end
