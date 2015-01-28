# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :echo do
    association :user
    long_url "https://www.google.com"

    factory :draft_echo do
      is_draft true
    end

  end
end
