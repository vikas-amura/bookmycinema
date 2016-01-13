class Show
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :starttime, type: DateTime
  field :endtime, type: DateTime

  #associations
  belongs_to :screen
  belongs_to :movie
  has_many :bookings
  has_many :tickets

  #validations
  validates :starttime, :endtime, presence: true

  after_create :save_movie_show_wise_ticket

  protected
  def save_movie_show_wise_ticket
      @show=self
      @show.screen.seats.each do |seat|
          @ticket = @show.tickets.create(type:seat.seat_type,seat_id:seat.id,movie_id:@show.movie.id)
      end
  end
end
