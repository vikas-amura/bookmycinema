class MovieFeedback < ApplicationMailer

	def movie_feedback(booking_id)
	    @booking = Booking.find(booking_id)
	    @token   = @booking.user.authentication_token
	    mail to: @booking.user.email
	end
end
