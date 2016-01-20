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
  field :rating, type: Integer
  field :release_date, type: Date

  #associations
  belongs_to :theatre
  has_many :shows
  has_many :bookings
  has_many :tickets
  has_many :comments

  #validations
  validates :name, :language, :genre, :duration, :movie_format, :trailer_url, :rating, :release_date, presence: true
  validates :name, :language, :genre, :movie_format, length: { minimum: 1, maximum: 50 }
  validates :language, :inclusion => %w(Hindi English Marathi)
  validates :genre, :inclusion => %w(Action Adventure Comedy Crime Fantasy Historical Historical Fiction Horror Magical Realism Mystery Paranoid Philosophical Political Romance Saga Satire Science Speculative Thriller Urban Western Animation')
  validates_numericality_of :rating, length: { minimum: 0, maximum: 10 }
  validates :trailer_url, length: { maximum: 500 }, format: { with: URI.regexp }

  def self.search(search)
    if search
      where({name: /#{search}/ })
    else
      scoped
    end
  end
end
