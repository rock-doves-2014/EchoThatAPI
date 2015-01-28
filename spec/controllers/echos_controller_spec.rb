require 'rails_helper'

RSpec.describe EchosController, :type => :controller do

  it "#expand should redirect to an external long_url" do
    echo = create(:echo)
    get :expand, short_url: echo.short_url
    expect(assigns(:echo)).to eq echo
    expect(response).to redirect_to "https://www.google.com"
  end

  pending "creates a new echo with correct defaults" do
    expect{
      post :create, echo: attributes_for(:echo)
    }. to change(Echo, :count).by 1
  end

  it "creates an array of echos and marks each for a social network"

end
