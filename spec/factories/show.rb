FactoryGirl.define do
  factory :show do
		starttime { Faker::Time.forward(23, :morning) }
	end
end
