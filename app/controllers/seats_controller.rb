class SeatsController < ApplicationController
	before_action :set_seat, only: [:show, :edit, :update, :destroy]
	before_action :load_authorize_parent

	def index
		@seats = @screen.seats.paginate(:page => params[:page],:per_page=>10)
	end

	def show
	end

	def new
		@seat = Seat.new
	end

	def edit
	end

	def create
		show_seat_type={100=>'Silver',150=>'Gold',200=>'Platinum'}
		@seat = @screen.seats.new(seat_params)
		respond_to do |format|
			if @seat
				seat_per_row=params['number_of_seat'].to_i
				seat_type =params['seat']['seat_type']
				(1..seat_per_row).each do |seat_number|
					@seat = @screen.seats.new(seat_params)
					@seat.seat_number=seat_number
					@seat.seat_price = show_seat_type.index(seat_type)
					@seat.save
				end

				format.html { redirect_to theatre_screen_seats_path(@theatre,@screen), notice: 'Seat was successfully created.' }
				format.json { render :show, status: :created, location: @seat }
			else
				format.html { render :new }
				format.json { render json: @seat.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @seat.update(seat_params)
				format.html { redirect_to theatre_screen_seats_path(@theatre,@screen), notice: 'Seat was successfully updated.' }
				format.json { render :show, status: :ok, location: @seat }
			else
				format.html { render :edit }
				format.json { render json: @seat.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
	end

	private

	def set_seat
		@seat = Seat.find(params[:id])
	end
	def seat_params
		params.require(:seat).permit(:row, :seat_number,:seat_price,:seat_type)
	end
	def load_authorize_parent
		if params[:screen_id].present?
			@theatre = Theatre.find(params[:theatre_id])
			@screen = @theatre.screens.find(params[:screen_id])
		end
	end
end
