class BookingsController < ApplicationController

	def index
		@user = User.find(current_user.id)
		@bookings = @user.bookings
	end

	def show
	end

	def new
		@booking = Booking.new
		@show = Show.find(params['show_id'])
	end

	def edit
	end
	def create
		@booking=Booking.new(booking_params)
		@booking.user_id=current_user.id
		@booking.ticket_numbers= @booking.id
		@booking.number_of_tickets=params['ticketid'].count
		amount=params['booking']['amount'].to_i
		@booking.amount= @booking.number_of_tickets * amount
		respond_to do |format|
			if @booking.save
				flash[:notice] = "Booking created successfully"
				Ticket.create_ticket(params['ticketid'], @booking);
				format.html { redirect_to booking_tickets_path(@booking) }
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

	private

	 def booking_params
      params.require(:booking).permit(:payment_mode, :card_type,:card_number,:movie_id,:show_id)
    end
end
