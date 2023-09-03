json.extract! reservation, :id, :rom_id, :check_in_date, :check_out_date, :guest_name, :guest_id, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
