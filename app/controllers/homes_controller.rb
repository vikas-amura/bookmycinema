class HomesController < ApplicationController

	def index
		@movies = Movie.all.select{|movie|  movie.shows.present?}.group_by {|movies| movies.language}
	end

	def theater_movies
		@theatre = Theatre.find(params['id'])
		@shows   = @theatre.shows.group_by {|x| x.movie.name}
	end

	def movie_theatres
		@movie = Movie.find(params['id'])
		@shows   = @movie.shows.group_by {|x| x.theatre.name}
	end


end
