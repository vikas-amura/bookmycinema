class TicketsController < ApplicationController

	def index
		@tickets =Ticket.where(booking_id:params['booking_id'])
	end

	def new

	end
	def show

	end
	def destroy

	end

end
