json.array!(@tabs) do |tab|
  json.extract! tab, :id, :name, :status, :paid
  json.url tab_url(tab, format: :json)
end
