class Movieshow
  include Mongoid::Document
  include Mongoid::Timestamps

  field :status, type: String ,:default => 'available'
  belongs_to :show
  belongs_to :seat


  def self.save_movies_show(showid,seatid)
  	@Movieshow=Movieshow.new
  	@Movieshow.show_id=showid.id
  	@Movieshow.seat_id=seatid
  	@Movieshow.save
  end
  def self.change_status(showid,seatid)
   # Movieshow.where(:show_id =>showid,:seat_id=>seatid).update_all(:status => 'booked')
   
  end

end
