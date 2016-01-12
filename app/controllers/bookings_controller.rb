class BookingsController < ApplicationController
	def index
		@bookings=Booking.all
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
		@booking=Booking.new(booking_params)
		@booking.user_id=current_user.id
		@booking.ticket_numbers="123456"
		@booking.number_of_tickets=params['seatids'].count
		amount=params['booking']['amount'].to_i
		@booking.amount= @booking.number_of_tickets * amount

		params['seatids'].each do |seatid|
			Movieshow.where(:seat_id=>seatid,:show_id=>params['booking']['show_id']).update_all(status: 'booked')
		end
		respond_to do |format|
			if @booking.save
				format.html { redirect_to booking_tickets_path(@booking), notice: 'Ticket was successfully created.' }
				format.json { render :show, status: :created, location: @booking }
			else
				format.html { render :new }
				format.json { render json: @booking.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
	end

	def destroy
	end

	def display
		@theatre    = Theatre.first
		@screens    = @theatre.screens
		@shows      = Show.all
	end

	private

	 def booking_params
      params.require(:booking).permit(:payment_mode, :card_type,:card_number,:movie_id)
    end
end