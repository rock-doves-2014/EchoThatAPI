require 'rails_helper'

RSpec.describe Echo, :type => :model do

  let(:params) do
    {"{\"body\":\"ectations ships with a number of bui \",\"url\":\"http://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers\",\"chrome_token\":\"jajajajajajajajajaja55555\"}"=>nil, "controller"=>"echos", "action"=>"create"}
  end

  it "should produce a valid args hashes for echos from the to_args class method" do
    args = Echo.to_args(params)
    echo = Echo.new(args[:echo])
    expect(echo.save).to be true
  end
end
