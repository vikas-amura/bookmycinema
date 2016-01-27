FactoryGirl.define do
  factory :ticket do
		number { Faker::Number.between(1, 10) }
    booking
    seat
    movie
    show
	end
end
