class HomesController < ApplicationController
  before_filter :authenticate_user!
	def index
		@movies = Movie.all.select{ |movie| movie.shows.present? }.group_by { |movies| movies.language }
	end

	def theater_movies
		@theatre = Theatre.find(params['id'])
		@shows = @theatre.shows.group_by { |t| t.movie.name}
	end

	def movie_theatres
		@movie = Movie.find(params['id'])
		@shows = @movie.shows.group_by { |s| s.theatre.name }
	end
  def all_theatres
    @theatres = Theatre.all.select{ |movie| movie.shows.present? }
  end
end
