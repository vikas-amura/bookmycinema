class SeatsController < ApplicationController
	load_and_authorize_resource
	before_action :load_authorize_parent
	def index
		@seats = @screen.seats.paginate(:page => params[:page],:per_page=>10)
	end
	def show
	end
	def new
	end
	def edit
	end
	def create
		@seat = @screen.seats.new(seat_params)
		respond_to do |format|
			flash[:notice] = "Seat created successfully"
			if Seat.save_multiple_seat(@seat)
				format.html { redirect_to theatre_screen_seats_path(@theatre,@screen) }
				format.json { render :show, status: :created, location: @seat }
			else
				format.html { render :new }
				format.json { render json: @seat.errors, status: :unprocessable_entity }
			end
		end
	end
	def update
		respond_to do |format|
			flash[:notice] = "Seat updated successfully"
			if @seat.update(seat_params)
				format.html { redirect_to theatre_screen_seats_path(@theatre,@screen) }
				format.json { render :show, status: :ok, location: @seat }
			else
				format.html { render :edit }
				format.json { render json: @seat.errors, status: :unprocessable_entity }
			end
		end
	end
	def destroy
		@seat.destroy
		respond_to do |format|
			flash[:notice] = "Seat deleted successfully"
			format.html { redirect_to theatre_screen_seats_path(@theatre,@screen) }
			format.json { head :no_content }
		end
	end
	private
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
