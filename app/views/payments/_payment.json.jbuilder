json.extract! payment, :id, :reservation_id, :payment_method, :amount, :payment_at, :created_at, :updated_at
json.url payment_url(payment, format: :json)
