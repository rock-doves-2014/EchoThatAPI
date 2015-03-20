require 'rails_helper'

RSpec.describe SupportEmail, :type => :model do

  it "gives itself the appropriate support email recipient" do
    ticket = create(:support_email)
    expect(ticket.recipient).to eq ENV["ECHO_GMAIL"]
  end

  it "builds a mail object" do
    ticket = create(:support_email)
    msg = ticket.build_email
    expect(msg).to be_a Mail::Message
  end

end
