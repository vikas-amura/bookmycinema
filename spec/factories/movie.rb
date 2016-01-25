FactoryGirl.define do
	factory :movie do
		name { Faker::Name.name }
		language { ["Hindi","English","Marathi"].sample }
		genre { ["Action","Comedy","Romantic"].sample }
		duration { Faker::Number.between(1, 10) }
		movie_format  { ["2D","3D","5D"].sample }
		trailer_url { Faker::Internet.url('example.com') }
		rating { Faker::Number.between(1, 10) }
		release_date { Faker::Date.between(2.days.ago, Date.today) }
	end
	#
	# factory :theatre do
	# 	name { Faker::Name.name }
	# 	address { Faker::Address.street_name  }
	# 	city { Faker::Address.city }
	# end
	#
	# factory :screen do
	# 	name {["A","B","C","D","E","F"].sample }
	# 	capacity {Faker::Number.between(100, 200)  }
	# 	theatre
	# end
	#
	# factory :show do
	# 	starttime { Faker::Time.between(2.days.ago, Time.now, :morning) }
	# 	endtime { Faker::Time.between(2.days.ago, Time.now, :afternoon) }
	# 	theatre
	# end
end
