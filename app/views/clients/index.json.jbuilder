json.array!(@clients) do |client|
  json.extract! client, :id, :entity_name, :bank_details
  json.url client_url(client, format: :json)
end
