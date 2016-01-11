class HomesController < ApplicationController
	def index
	end

	def display
		@theatre    = Theatre.first
		@screens    = @theatre.screens

		@shows = Show.all
	end
end
