class Theatre
  include Mongoid::Document
  include Mongoid::Timestamps

  field :name, type: String
  field :address, type: String
  field :city, type: String

  has_many :movies
  has_many :screens
end
