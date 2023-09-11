json.extract! inventory, :id, :hotel_id, :room_type_id, :date, :total_inventory, :total_reserved, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
