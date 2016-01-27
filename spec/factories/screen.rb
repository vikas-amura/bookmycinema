FactoryGirl.define do
  factory :screen do
		name { ("A".."M").to_a.sample }
		capacity { Faker::Number.between(100, 200) }
    theatre
	end
end
