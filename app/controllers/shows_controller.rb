class ShowsController < ApplicationController
	before_action :set_show, only: [:show, :edit, :update, :destroy]
	before_action :load_authorize_parent

	def index
		@shows   = @movie.shows.all
	end

	def show
		@screen  = @show.screen
		@seats   = @screen.seats
		@book    = @show.tickets
	end

	def new
		city 		= {:city=>'Pune'}
		@theatre 	= Theatre.get_all_theatre(city)
		@show    	= Show.new
	end

	def edit
		city 		= {:city=>'Pune'}
		@theatre 	= Theatre.get_all_theatre(city)
	end

	def create
		@show = @movie.shows.new(show_params)
		@show.endtime = (@show.starttime.to_time + @movie.duration.hours).to_datetime
		respond_to do |format|
			if @show.save
				format.html { redirect_to edit_movie_show_path(@movie,@show), notice: 'Show was successfully created.' }
				format.json { render :show, status: :created, location: @show }
			else
				format.html { render :new }
				format.json { render json: @show.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		respond_to do |format|
			if @show.update(show_params)
				format.html { redirect_to edit_movie_show_path(@movie,@show), notice: 'Show was successfully updated.' }
				format.json { render :show, status: :ok, location: @show }
			else
				format.html { render :edit }
				format.json { render json: @show.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@show.destroy
		respond_to do |format|
			format.html { redirect_to movie_shows_path(@movie), notice: 'Show was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	def set_show
		@show = Show.find(params[:id])
	end

	def show_params
		params.require(:show).permit(:starttime, :endtime, :screen_id)
	end

	def load_authorize_parent
		if params[:movie_id].present?
			@movie = Movie.find(params[:movie_id])
		end
	end

end