json.array!(@drinks) do |drink|
  json.extract! drink, :id, :name, :date, :cost
  json.url drink_url(drink, format: :json)
end
