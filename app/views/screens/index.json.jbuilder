json.array!(@screens) do |screen|
  json.extract! screen, :id, :name, :capacity
  json.url screen_url(screen, format: :json)
end
