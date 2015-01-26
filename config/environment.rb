# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
require 'dotenv'
require 'EchoFactory'
Dotenv.load
require 'omniauth-twitter'
require 'twitter'

$client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CONSUMER"]
  config.consumer_secret     = ENV["TWITTER_SECRET"]
  config.access_token        = ENV["TWITTER_TOKEN"]
  config.access_token_secret = ENV["TWITTER_TOKEN_SECRET"]
end

