class Movie
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :name, type: String
  field :language, type: String
  field :genre, type: String
  field :duration, type: Float
  field :movie_format, type: String
  #field :poster, type: String #TODO Paperclip gem
  field :trailer_url, type: String
  field :rating, type: Float
  field :release_date, type: Date

  #associations
  belongs_to :theatre
  has_many :shows
  has_many :bookings
  has_many :tickets

  #validations
  validates :name, :language, :genre, :duration, :movie_format, :trailer_url, :rating, :release_date, presence: true
  validates :name, :language, :genre, :movie_format, length: { minimum: 1, maximum: 50 }
  validates_numericality_of :rating
  validates :trailer_url, length: { maximum: 500 }
end
