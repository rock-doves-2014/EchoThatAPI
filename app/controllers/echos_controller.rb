class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    hashtext = JSON.parse(params.first[0])
    user = User.find_by(google_credentials: hashtext['google_credentials'])
    $client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = user.twitter_token
      config.access_token_secret = user.twitter_token_secret
    end
    $client.update("#{hashtext['message']} - #{hashtext['url']}")
    render status: 200
  end

  def new
    @echo = Echo.new
  end

  def expand
    @echo = Echo.find_by(short_url: params[:short_url] )
    redirect_to @echo.long_url
  end

end