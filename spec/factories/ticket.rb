FactoryGirl.define do
  factory :ticket do
		number { Faker::Number.between(1, 10) }
	end
end
