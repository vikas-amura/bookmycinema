class Booking
  include Mongoid::Document
  include Mongoid::Timestamps

  #TODO add hash for payment details
  field :ticket_numbres, type: String
  field :number_of_tickets, type: Integer
  field :amount, type: Float
  field :payment_mode, type: String
  field :card_type, type: String
  field :card_number, type: Integer

  belongs_to :user
  belongs_to :movie
  has_many :tickets
end
