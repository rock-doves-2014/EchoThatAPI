require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:params) do
    {"{\"google_credentials\":\"gmailjane \",\"always_link\":\"false\"}"=>nil, "controller"=>"users", "action"=>"create"}
  end

  it "should produce proper user args from the to_args class method" do
    args = User.to_args(params)
    guy = User.new(args[:user])
    expect(guy.save).to be true
  end
end
