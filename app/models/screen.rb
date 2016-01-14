class Screen
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :name, type: String
  field :capacity, type: Integer

  #associations
  belongs_to :theatre
  has_many   :seats
  has_many   :shows

  #validations
  validates :name, :capacity, presence: true
  validates :capacity, numericality: { only_integer: true }
  validates_inclusion_of :capacity, in: 20..200
  validates :name, length: { minimum: 1, maximum: 50 }
end
