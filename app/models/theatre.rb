class Theatre
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :name, type: String
  field :address, type: String
  field :city, type: String

  #associations
  has_many :movies
  has_many :screens

  #validations
  validates :name, :address, :city, presence: true
end
