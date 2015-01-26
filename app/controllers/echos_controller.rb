class EchosController < ApplicationController

  def create
    echo = EchoFactory.construct_echo(params[:echo])
    echo.save
    render text: echo
  end

  def new
    @echo = Echo.new
  end

end
