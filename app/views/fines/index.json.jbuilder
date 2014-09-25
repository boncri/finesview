json.array!(@fines) do |fine|
  json.extract! fine, :id, :number, :plate, :taken_at, :amount
  json.url fine_url(fine, format: :json)
end
