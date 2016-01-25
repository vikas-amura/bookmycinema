class Comment
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :rating, type: Integer
  field :review, type: String
  field :status, type: String, default: "pending"
  field :approved_by, type: String

  #associations
  belongs_to :user
  belongs_to :movie

  #validations
  validates :rating, :review, :status, :approved_by, presence: true
  validates_numericality_of :rating, length: { minimum: 0, maximum: 10 }
end
