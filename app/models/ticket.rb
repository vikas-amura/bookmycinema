class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  #attributes
  field :number ,type: String
  field :type ,type: String
  field :price ,type: Float

  #associations
  belongs_to :booking
  belongs_to :seat
  belongs_to :movie
  belongs_to :show

  #validations
  validates :number, :type, :price, presence: true
  validates_numericality_of :price
  validates :type , length: { minimum: 1, maximum: 10 }
end
