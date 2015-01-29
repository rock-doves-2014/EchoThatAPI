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
    credentials = request.env['omniauth.auth']["google_credentials"]
    user = User.find_by(google_credentials: params['google_credentials']) || User.find_by(google_credentials: credentials)

    if params['provider'] == 'twitter'
      user.update(twitter_token: credentials['token'], twitter_token_secret: credentials['secret'])
    elsif params['provider'] == 'facebook'
      user.update(facebook_token: credentials['token'], facebook_token_secret: "exp: #{credentials['expires_at']}")
    end
    render html: "<strong>Done. Get on posting!!</strong>".html_safe
  end

  def destroy

  end

end
