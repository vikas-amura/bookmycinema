FactoryGirl.define do
	factory :movie do
		name { Faker::Name.name }
		language { ["Hindi","English","Marathi"].sample }
		genre { ["Action","Adventure","Comedy"].sample }
		duration { Faker::Number.between(1, 10) }
		movie_format  { ["2D","3D","5D"].sample }
		trailer_url { Faker::Internet.url('example.com') }
		rating { Faker::Number.between(1, 10) }
		release_date { Faker::Date.between(2.days.ago, Date.today) }
		theatre
	end
end
