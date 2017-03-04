json.extract! guest, :id, :name, :message, :created_at, :updated_at
json.url guest_url(guest, format: :json)
