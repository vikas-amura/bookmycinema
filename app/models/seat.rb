class Seat
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :row, type: String
  field :seat_number, type: Integer

  #associations
  belongs_to :screen
  has_one :ticket

  #validations
  validates :row, :seat_number, presence: true
  validates :row, length: { minimum: 1, maximum: 2 }
  validates :seat_number, numericality: { only_integer: true }

  validates_with screen
  #add validation on seats. don't allot seat if don't have capacity
end
