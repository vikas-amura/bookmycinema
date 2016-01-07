class Show
  include Mongoid::Document
  include Mongoid::Timestamps

  field :starttime, type: DateTime
  field :endtime, type: DateTime

  belongs_to :screen
  belongs_to :movie
  has_many :bookings
  has_many :tickets
end
