class TicketConfirmJob < ActiveJob::Base
  queue_as :default
   def perform(booking_id)
    TicketBook.booking_confirm(booking_id).deliver
  end
end
