FactoryGirl.define do
  factory :comment do
		rating { Faker::Number.between(1, 10) }
    review { Faker::Hacker.say_something_smart }
    status { ["Approved","Pending"].sample }
    approved_by { Faker::Name.first_name }
    movie
	end
end
