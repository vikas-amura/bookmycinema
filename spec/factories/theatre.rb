FactoryGirl.define do
  factory :theatre do
    name { Faker::Lorem.word }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
  end
end
