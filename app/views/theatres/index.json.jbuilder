json.array!(@theatres) do |theatre|
  json.extract! theatre, :id, :name, :address, :city
  json.url theatre_url(theatre, format: :json)
end
