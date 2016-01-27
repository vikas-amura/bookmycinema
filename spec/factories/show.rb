FactoryGirl.define do
  factory :show do
		starttime { Faker::Time.forward(23, :morning) }
    endtime { Faker::Time.forward(23, :morning) }
    screen
    movie
    theatre
	end
end
