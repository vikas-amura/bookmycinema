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

#301 41 33 74
#302 33 32 65
#303 41 38 79
#304 50 44 94
#305 41 35 76
#306 43 36 79
#308 36 36 72
#5.670 / 6

#539 / 700
