json.array!(@sales) do |sale|
  json.extract! sale, :id, :drink_id
  json.url sale_url(sale, format: :json)
end
