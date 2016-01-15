class HomesController < ApplicationController

  def index
    @shows = Show.all
    @theatres = Theatre.order_by(:name=>'ASC')
	end

	def display
    @shows = Theatre.find(params['id']).shows.all
  end


end
