require 'rails_helper'

RSpec.describe Echo, :type => :model do

  let(:params){ {
    "{\"message\":\"From Wikipedia, the free encyclopedia \",\"url\":\"https://en.wikipedia.org/wiki/Batman:_Arkham_City\",\"google_credentials\":\"104171572057165723377\",
    \"chrome_token\":\"23imtculozn89v5fysbg470ep\"}"=>nil,
     "controller"=>"echos",
      "action"=>"create"}
    }

  it "should produce a hash with default values to_args class method" do
    args = Echo.to_args(params)
    defaults = [:is_draft, :body, :long_url]
    defaults.each do |attrib|
      expect(args.keys.include?(attrib)).to be true
    end
  end
end
