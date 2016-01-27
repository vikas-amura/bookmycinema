FactoryGirl.define do
  factory :booking do
    ticket_numbers { Faker::Number.between(1, 15) }
    number_of_tickets { Faker::Number.between(1, 10) }
    amount { Faker::Number.between(90, 2000) }
    payment_mode { ["online"].sample }
    card_type { Faker::Business.credit_card_type }
    card_number { Faker::Number.between(100000000, 10000000000000000000) }
    movie
	end
end
