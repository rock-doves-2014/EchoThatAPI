class EchosController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    args = Echo.to_args(params.first[0])


    # hashtext = JSON.parse(params.first[0])
    # text = hashtext["message"]
    # url = hashtext["url"]
    $client.update("#{text} - #{url}")
    return 200
  end

  def new
    @echo = Echo.new
  end

  def expand
    @echo = Echo.find_by(short_url: expand_path(params[:id]) )
    redirect_do @echo[:long_url]
  end

end
