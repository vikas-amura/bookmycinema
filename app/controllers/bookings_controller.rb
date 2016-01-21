class BookingsController < ApplicationController

	def index
		@bookings = current_user.bookings
	end
	def new
		@booking = Booking.new
		@show = Show.find(params['show_id'])
		@all_seat = @show.screen.seats.order('row asc').group_by{|x| x.row }
	end
	def edit
	end
	def create
		@booking=Booking.new(booking_params)
		@booking.user_id=current_user.id
		@booking.ticket_numbers= @booking.id
		@booking.number_of_tickets=params['ticketid'].count
		respond_to do |format|
			if @booking.save
				flash[:notice] = "Booking created successfully"
				Ticket.create_ticket(params['ticketid'], @booking);
				TicketConfirmJob.perform_later(@booking.id.to_s)
				format.html { redirect_to booking_tickets_path(@booking) }
				format.json { render :show, status: :created, location: @booking }
			else
				format.html { render :new }
				format.json { render json: @booking.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
	@booking = Booking.find(params[:id])
    @booking.destroy
    respond_to do |format|
      flash[:notice] = "Booking destroyed successfully"
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end

	private
	def booking_params
		params.require(:booking).permit(:payment_mode, :card_type,:card_number,:movie_id,:show_id)
	end


end
