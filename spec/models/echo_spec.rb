require 'rails_helper'

RSpec.describe Echo, :type => :model do

  pending "should produce a hash with default values to_args class method" do
    args = Echo.to_args(params)
    defaults = [:is_draft, :body, :long_url]
    expect(args.keys.include?(defaults)).to be true
  end
end
