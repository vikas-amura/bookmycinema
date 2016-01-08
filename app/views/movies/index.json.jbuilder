json.array!(@movies) do |movie|
  json.extract! movie, :id, :name, :language, :genre, :duration, :movie_format, :trailer_url, :rating, :release_date
  json.url movie_url(movie, format: :json)
end
