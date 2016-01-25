FactoryGirl.define do
  factory :screen do
		name { ["A","B","C","D","E","F"].sample }
		capacity { Faker::Number.between(100, 200) }
	end
end
