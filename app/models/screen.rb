class Screen
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :capacity, type: Integer

  belongs_to :theatre
  has_many :seats
  has_many :show
end
