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
    user = User.find_by(google_credentials: params['google_credentials'])
    user.update(twitter_token: t_cred['token'], twitter_token_secret: t_cred['secret'])
    render html: "<strong>Done. Get on tweeting!</strong>".html_safe
  end

  def destroy

  end

end