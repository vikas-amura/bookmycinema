FactoryGirl.define do
	factory :user do
		first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    encrypted_password { Faker::Internet.password(8,18) }
    mobile { Faker::PhoneNumber.phone_number }
    gender { ["Male", "Female"].sample }
    date_of_birth { Faker::Time.between(2.days.ago, Time.now, :day) }
    role { ["user"].sample }
	end
end
