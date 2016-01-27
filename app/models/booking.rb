class Booking
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  #TODO add hash for payment details
  field :ticket_numbers, type: String
  field :number_of_tickets, type: Integer
  field :amount, type: Float
  field :payment_mode, type: String
  field :card_type, type: String
  field :card_number, type: Integer

  #associations
  belongs_to :user
  belongs_to :movie
  belongs_to :show
  has_many :tickets, dependent: :destroy

  #validations
  validates :ticket_numbers, :number_of_tickets, :amount, :payment_mode, :card_type, :card_number ,presence: true
  validates_numericality_of :number_of_tickets, :amount, :ticket_numbers
  validates_inclusion_of :number_of_tickets, in: 1..10
  validates :card_number, numericality: { only_integer: true }, length: { minimum: 9, maximum: 19 }
end
