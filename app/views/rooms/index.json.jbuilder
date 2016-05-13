json.array!(@rooms) do |room|
  json.extract! room, :id, :name, :volume, :temperature_min, :temperature_max, :wet_min, :wet_max
  json.url room_url(room, format: :json)
end
