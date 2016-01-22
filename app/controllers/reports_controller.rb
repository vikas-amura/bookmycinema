class ReportsController < ApplicationController
	def index
		@count = Ticket.collection.aggregate( [ { "$group" => { _id: "$movie_id", ticket_count: { "$sum" => 1 } } } ] ).to_a
		@language = Movie.collection.aggregate( [ { "$group" => { _id: "$language", language_movie_count: { "$sum" => 1 } } } ] ).to_a
		@genre = Movie.collection.aggregate( [ { "$group" => { _id: "$genre", genre_movie_count: { "$sum" => 1 } } } ] ).to_a

		@shows=Show.all.select{|show|  show.tickets.count > 0}.group_by {|show| show.starttime.hour}
		@tickets = Ticket.collection.aggregate( [ { "$group" => {_id: "$show_id", ticket_count: { "$sum" => 1 } } } ] ).to_a

		@ticket_list= {}
		@tickets.each do |showid|
			@shows.each do |showtime, show|
				show.each do |s|
					if s['id'] == showid['_id']
						if @ticket_list[showtime].present?
							@ticket_list[showtime]=@ticket_list[showtime]+showid['ticket_count']
						else
							@ticket_list[showtime]=showid['ticket_count']
						end
					end
				end
			end
		end

	end
end
