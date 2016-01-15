class Show
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :starttime, type: DateTime
  field :endtime, type: DateTime

  #associations
  belongs_to :screen
  belongs_to :movie
  belongs_to :theatre
  has_many :bookings
  has_many :tickets

  #validations
  validates :starttime, :endtime, presence: true
end
