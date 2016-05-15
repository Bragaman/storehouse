json.array!(@agreements) do |agreement|
  json.extract! agreement, :id, :receipt_date, :expiration_date, :client_id, :stack_id, :position
  json.url agreement_url(agreement, format: :json)
end
