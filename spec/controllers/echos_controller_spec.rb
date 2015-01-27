require 'rails_helper'

RSpec.describe EchosController, :type => :controller do

  it "#expand should redirect to an external long_url" do
    echo = create(:echo)
    get :expand, short_url: echo.short_url
    expect(assigns(:echo)).to eq echo
    expect(response).to redirect_to "https://www.google.com"
  end
end
