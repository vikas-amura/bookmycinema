class BookingsController < ApplicationController
	def index
	end

	def show
	end

	def new
	end

	def edit
	end

	def create
		@booking = Booking.new
		@booking.ticket_numbers     ="123554"
		@booking.number_of_tickets  = 4
		@booking.amount             = 3222
		@booking.payment_mode       = "cash"
		@booking.card_type          = "Debit"
		@booking.card_number        =123456789555
		@booking.user_id            = current_user.id
		@booking.movie_id           = "568e749f839a1e1bf4000000"
		debugger
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
end