Rails.application.config.middleware.use OmniAuth::Builder do
  require "dotenv"
  Dotenv.load
  provider :twitter, ENV['TWITTER_CONSUMER'], ENV['TWITTER_SECRET']
end