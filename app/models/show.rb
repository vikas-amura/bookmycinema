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
  has_many :movieshows

  #validations
  validates :starttime, :endtime, presence: true
end
