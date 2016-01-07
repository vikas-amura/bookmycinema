class Ticket
  include Mongoid::Document
  include Mongoid::Timestamps

  field :number ,type: String
  field :type ,type: String
  field :price ,type: Float

  belongs_to :booking
  belongs_to :seat
  belongs_to :movie
  belongs_to :show
end
