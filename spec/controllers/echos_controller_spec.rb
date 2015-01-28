require 'rails_helper'

RSpec.describe EchosController, :type => :controller do

  let(:params){ {
  "{\"message\":\"From Wikipedia, the free encyclopedia \",\"url\":\"https://en.wikipedia.org/wiki/Batman:_Arkham_City\",\"google_credentials\":\"104171572057165723377\",
  \"chrome_token\":\"23imtculozn89v5fysbg470ep\"}"=>nil,
   "controller"=>"echos",
    "action"=>"create"}
  }

  it "#expand should redirect to an external long_url" do
    echo = create(:echo)
    get :expand, short_url: echo.short_url
    expect(assigns(:echo)).to eq echo
    expect(response).to redirect_to "https://www.google.com"
  end

  it "creates a new echo with correct defaults" do

  end

  it "creates an array of echos and marks each for a social network"

end
