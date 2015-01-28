class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    args_echo = Echo.to_args(params)
    args_user = User.to_args(params)
    user = User.find_by(google_credentials: args_user[:google_credentials])

    outlets = user.accounts
    echos = Echo.build_for_each_outlet(outlets, args_echo)
    echos.each {|e| user.echos << e}

    client = init_twitter(user)
    echos.each{|e| e.update_if_twitter(client)}

    render status: 200
  end

  def new
    @echo = Echo.new
  end

  def expand
    @echo = Echo.find_by(short_url: params[:short_url] )
    redirect_to @echo.long_url
  end

  private

  def init_twitter(user)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = user.twitter_token
      config.access_token_secret = user.twitter_token_secret
    end
    client
  end

end