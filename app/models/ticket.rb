class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :number ,type: String

  #associations
  belongs_to :booking
  belongs_to :seat
  belongs_to :movie
  belongs_to :show

  #validations
  validates :number, presence: true
  validates_numericality_of :number

  def self.create_ticket(seats, booking)
    @ticket_amount = 0

    seats.each do |seat|
      ticket = booking.tickets.create(seat_id:seat, movie_id:booking.movie.id, show_id:booking.show.id)
      @ticket_amount = @ticket_amount + ticket.seat.seat_price
    end

    booking.amount = @ticket_amount
    booking.save
  end
end
