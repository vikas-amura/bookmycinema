FactoryGirl.define do
	factory :seat do
    row { ("A".."Z").to_a.sample }
    seat_number { Faker::Number.between(1, 10) }
    seat_price { [90, 120, 150, 180, 200, 220].sample }
    seat_type { ["Gold", "Silver", "Platinum"].sample }
	end
end
