class Seat
  include Mongoid::Document
  include Mongoid::Timestamps

  field :row, type: String
  field :seat_number, type: Integer

  belongs_to :screen
  has_one :ticket
end
