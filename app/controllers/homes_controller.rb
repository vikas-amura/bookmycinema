class HomesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@movies = Movie.includes(:shows).select{|movie|  movie.shows.count > 0}.group_by {|movies| movies.language}
	end

	def theatre_wise_movies
		@theatre = Theatre.find(params['id'])
		@shows = @theatre.shows.group_by {|show| show.movie.name}
	end
	def movie_in_theatres
		@movie = Movie.find(params['id'])
		@shows = @movie.shows.group_by {|show| show.theatre.name }
	end
	def all_theatres
		@theatres = Theatre.limit(20).select{|movie|  movie.shows.count>0}
	end
	def thank_you

	end
end
