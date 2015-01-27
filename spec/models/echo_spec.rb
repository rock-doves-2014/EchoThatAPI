require 'rails_helper'

RSpec.describe Echo, :type => :model do
  let(:params) do
    {"{\"message\":\"ectations ships with a number of bui \",\"url\":\"http://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers\"}"=>nil, "controller"=>"echos", "action"=>"create"}
  end

  it "should produce an array of args hashes for echos from the to_args_array class method" do
    args_array = Echo.to_args_array(params)
    echo = Echo.new(args_array.first[:echo])
    expect(echo.save).to be true
  end
end
