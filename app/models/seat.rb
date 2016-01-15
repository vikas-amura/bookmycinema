class Seat
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :row, type: String
  field :seat_number, type: Integer
  field :seat_price, type: Integer
  field :seat_type, type: String

  #associations
  belongs_to :screen
  has_many :tickets


  #validations
  validates :row, :seat_number, :seat_price, presence: true
  validates :row, length: { minimum: 1, maximum: 2 }
  validates :seat_number, numericality: { only_integer: true }

  #add validation on seats. don't allot seat if don't have capacity
end
