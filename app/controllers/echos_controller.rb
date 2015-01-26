class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    hashtext = JSON.parse(params.first[0])

    p hashtext["message"]
    p hashtext["url"]

    echo = EchoFactory.construct_echo(params[:echo])
    echo.save
    render text: echo
  end

  def new
    @echo = Echo.new
  end

end
