json.array!(@products) do |product|
  json.extract! product, :id, :width, :height, :length, :weight, :agreement_number, :temperature_min, :temperature_max, :humidity_min, :humidity_max, :agreement_id
  json.url product_url(product, format: :json)
end
