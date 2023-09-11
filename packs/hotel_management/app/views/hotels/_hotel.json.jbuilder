json.extract! hotel, :id, :hotel_name, :hotel_address, :created_at, :updated_at
json.url hotel_url(hotel, format: :json)
