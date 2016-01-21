# Preview all emails at http://localhost:3000/rails/mailers/ticket_book
class TicketBookPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_book/booking_confirm
  def booking_confirm
    TicketBook.booking_confirm
  end

end
