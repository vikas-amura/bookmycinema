class BookingObserver < Mongoid::Observer
	def after_create(booking)
		TicketConfirmJob.perform_later(booking.id.to_s)
	end
end