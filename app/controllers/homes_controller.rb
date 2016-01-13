class HomesController < ApplicationController
  before_action :authenticate_user!

  def index
    @movie = Movie.all
    @theatre=Theatre.first
	end

	def display
		@theatre = Theatre.find(params['id'])
        @shows = Show.all
	end
end
