class TicketBook < ApplicationMailer

  def booking_confirm(booking)
    @booking = booking
    mail to: @booking.user.email
  end
end
