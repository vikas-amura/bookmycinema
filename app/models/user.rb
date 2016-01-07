class User
  include Mongoid::Document
  include Mongoid::Timestamps

  field :first_name, type: String
  field :last_name, type: String
  field :email, type: String
  field :password, type: String
  field :mobile, type: Integer
  field :gender, type: String
  field :date_of_birth, type: Date

  has_many :bookings
end
