# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :support_email do
    sender "joe@complaints.co.uk"
    body "This is quite a test I'm sending you, chap."
    subject "A bug fix from Joe"
  end
end
