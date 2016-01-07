class User
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  field :mobile, type: Integer
  field :gender, type: String
  field :date_of_birth, type: Date

  #associations
  has_many :bookings

  #validations
  validates :first_name, :last_name, :email, :password, :mobile, :gender, :date_of_birth, presence: true
  validates :email, uniqueness: true, length: { minimum: 3, maximum: 253 }, format: { with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i }
  validates :first_name, :last_name, length: { minimum: 2 }
  validates :password, length: { in: 6..20 }
  validates :mobile, numericality: { only_integer: true }, length: { is: 10 }
end
