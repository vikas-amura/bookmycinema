class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :number ,type: String
  field :price ,type: Float

  #associations
  belongs_to :booking
  belongs_to :seat
  belongs_to :movie
  belongs_to :show

  #validations
  #validates :number, :price, presence: true
  #validates_numericality_of :price
  #validates :type , length: { minimum: 1, maximum: 10 }

  def self.create_ticket(seats,booking)
      seats.each do |seat|
          @ticket = booking.tickets.create(seat_id:seat,movie_id:booking.movie.id,show_id:booking.show.id)
      end
  end
end
