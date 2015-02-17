class UsersController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new

  end

  def create
    hashtext = JSON.parse(params.first[0])
    token = User.generate_token
    user = User.find_or_create_by(google_credentials: hashtext['email'])
    user.chrome_token = token;
    user.save
    answer = {message: "success", key: token}
    render json: answer
  end

  def update
    if params['provider'] == 'twitter'
      credentials = request.env['omniauth.auth'].credentials
      user = User.find_by(google_credentials: params['google_credentials'])
      user.update(twitter_token: credentials['token'], twitter_token_secret: credentials['secret'])

    elsif params['provider'] == 'facebook'
      google_email = request.env['omniauth.params']["google_credentials"]
      credentials = request.env['omniauth.auth']['credentials']
      user = User.find_by(google_credentials: google_email)
      user.facebook_token = credentials['token']
      user.facebook_token_secret = "exp: #{credentials['expires_at']}"
      user.save!
    end
  end

  def update_sharing
  end

  def destroy

  end

end
