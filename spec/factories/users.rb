FactoryGirl.define do
  factory :user do

    factory :valid_user do
      google_credentials "gmailjane"
      always_link false
      facebook_floor 140
    end

    factory :invalid_user do
      google_credentials ""
    end

  end
end
