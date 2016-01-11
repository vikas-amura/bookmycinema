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
		@data=params
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