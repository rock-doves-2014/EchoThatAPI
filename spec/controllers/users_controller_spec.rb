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

  it "format the params into a hash that contains all required user attributes" do
    args = User.to_args(params)
    user_attribs = User.new.attributes.keys
    expect(user_attribs - args.keys).to eq []
  end

  it "saves a User" do
    expect{
      post :create, user: attributes_for(:valid_user)
    }. to change(User, :count).by 1
  end

  it "saves a User with the proper default values"

end
