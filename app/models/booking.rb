class Booking
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  #TODO add hash for payment details
  field :ticket_numbres, type: String
  field :number_of_tickets, type: Integer
  field :amount, type: Float
  field :payment_mode, type: String
  field :card_type, type: String
  field :card_number, type: Integer

  #associations
  belongs_to :user
  belongs_to :movie
  has_many :tickets

  #validations
  validates :ticket_numbres, :number_of_tickets, :amount, :payment_mode, :card_type, :card_number ,presence: true
  validates_numericality_of :number_of_tickets
  validates_inclusion_of :number_of_tickets, in: 1..10
  validates :card_number, numericality: { only_integer: true }, length: { minimum: 13, maximum: 19 }
end
