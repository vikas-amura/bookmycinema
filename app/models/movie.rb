class Movie
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :language, type: String
  field :genre, type: String
  field :duration, type: Float
  field :movie_format, type: String
  #field :poster, type: String #TODO Paperclip gem
  field :trailer_url, type: String
  field :rating, type: Float
  field :release_date, type: Date

  belongs_to :theatre
  has_many :shows
  has_many :bookings
  has_many :tickets
end
