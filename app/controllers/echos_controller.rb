class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    hashtext = JSON.parse(params.first[0])
    text = hashtext["message"]
    url = hashtext["url"]
    $client.update("#{text} - #{url}")
    return 200
  end

  def new
    @echo = Echo.new
  end

end
