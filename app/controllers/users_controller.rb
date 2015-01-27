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

  def destroy

  end

end