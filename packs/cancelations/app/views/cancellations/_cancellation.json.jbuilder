json.extract! cancellation, :id, :reason, :cancelled_at, :created_at, :updated_at
json.url cancellation_url(cancellation, format: :json)
