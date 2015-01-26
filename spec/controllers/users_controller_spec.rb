require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  let(:params) do
    {"{\"message\":\"ectations ships with a number of bui \",\"url\":\"http://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers\"}"=>nil, "controller"=>"echos", "action"=>"create"}
  end

  it "handles and reads params that convert into Json" do
    hashtext = JSON.parse(params.first[0])
    expect(hashtext).to be_a Hash
    expect(hashtext["message"].length).to be > 5
    expect(hashtext["url"].length).to be > 5
    expect(hashtext["message"]).to be_a String
  end

  it "format the params into a hash that contains all required user attributes"

end
