json.array!(@discounts) do |discount|
  json.extract! discount, :id, :date, :amount
  json.url discount_url(discount, format: :json)
end
