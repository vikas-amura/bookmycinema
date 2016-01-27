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
  validates :row, :seat_number, :seat_price, :seat_type, presence: true
  validates :row, length: { minimum: 1, maximum: 2 }
  validates :seat_number, numericality: { only_integer: true }

  def self.save_multiple_seat(seat)
    show_seat_type = {100 => 'Silver', 150 => 'Gold', 200 => 'Platinum'}
    seat_per_row = seat['seat_number'].to_i
    (1..seat_per_row).each do |seat_number|
      @seat = Seat.new
      @seat.row = seat['row']
      @seat.seat_number = seat_number
      @seat.seat_type = seat['seat_type']
      @seat.screen_id = seat['screen_id']
      @seat.save
      @seat.seat_price = show_seat_type.index(seat['seat_type'])
    end
  end
end
