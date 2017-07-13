json.extract! phone, :id, :vendor, :model, :version, :price, :description, :created_at, :updated_at
json.url phone_url(phone, format: :json)
