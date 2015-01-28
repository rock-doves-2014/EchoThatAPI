class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    args = Echo.to_args(params)
    creds = User.to_args(params)[:google_credentials]
    user = User.find_by(google_credentials: creds)
    outlets = user.accounts
    echos = Echo.build_for_each_outlet(outlets, args)
    echos.each do |e|
      user.echos << e
    end

    #add Jorge's send action
    #$client.update("#{text} - #{url}")
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
