class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movie = Movie.all
	end

	def display
		@theatre = Theatre.first
		@screens = @theatre.screens
    @shows = Show.all
	end
end
