class HomesController < ApplicationController
	before_filter :authenticate_user!

	def index
		@movies = Movie.limit(20).desc(:rating).select{|movie|  movie.shows.count > 0 and movie.release_date.strftime("%m/%d/%Y") <= Time.now.strftime("%m/%d/%Y")}.group_by {|movies| movies.language}
	end
	def theater_movies
		@theatre = Theatre.find(params['id'])
		@shows   = @theatre.shows.group_by {|show| show.movie.name}
	end
	def movie_theatres
		@movie = Movie.find(params['id'])
		@shows   = @movie.shows.group_by {|show| show.theatre.name}
	end
	def all_theatres
		@theatres = Theatre.all.select{|movie|  movie.shows.count>0}
	end
	def thank_you

	end
end