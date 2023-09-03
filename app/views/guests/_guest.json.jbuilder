json.extract! guest, :id, :guest_name, :guest_phone_number, :guest_email, :guest_address, :created_at, :updated_at
json.url guest_url(guest, format: :json)
