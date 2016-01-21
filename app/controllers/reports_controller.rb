class ReportsController < ApplicationController
  def index
    @count = Ticket.collection.aggregate( [ { "$group" => { _id: "$movie_id", ticket_count: { "$sum" => 1 } } } ] ).to_a
    @language = Movie.collection.aggregate( [ { "$group" => { _id: "$language", language_movie_count: { "$sum" => 1 } } } ] ).to_a
    @genre = Movie.collection.aggregate( [ { "$group" => { _id: "$genre", genre_movie_count: { "$sum" => 1 } } } ] ).to_a
  end
end
