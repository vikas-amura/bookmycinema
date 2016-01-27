class TicketBook < ApplicationMailer

	def booking_confirm(booking_id)
		@booking = Booking.find(booking_id)
		mail to: @booking.user.email
	end
end
