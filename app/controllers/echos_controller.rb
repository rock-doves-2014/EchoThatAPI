class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    p "*************************"
    p params
    p "*************************"


    echo = EchoFactory.construct_echo(params[:echo])
    echo.save
    render text: echo
  end

  def new
    @echo = Echo.new
  end

end
