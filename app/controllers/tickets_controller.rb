class TicketsController < ApplicationController

	def index
		@user = User.find(current_user.id)

		@bookings = @user.bookings
	end

	def new

	end
	def show

	end
	def destroy

	end

end
