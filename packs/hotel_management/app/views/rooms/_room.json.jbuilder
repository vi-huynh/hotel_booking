json.extract! room, :id, :rom_number, :room_type, :room_price, :created_at, :updated_at
json.url room_url(room, format: :json)
