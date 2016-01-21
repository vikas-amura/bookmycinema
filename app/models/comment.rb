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
end