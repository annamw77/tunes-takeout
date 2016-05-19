Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, 'app_id', 'app_secret'
end
