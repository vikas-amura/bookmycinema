FactoryGirl.define do
	factory :seat do
    row { ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q"].sample }
    seat_number { Faker::Number.between(1, 10) }
    seat_price { [90, 120, 150, 180, 200, 220].sample }
    seat_type { ["Gold", "Silver", "Platinum"].sample }
	end
end
