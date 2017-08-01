json.extract! post, :id, :title, :announce, :body, :created_at, :updated_at
json.url post_url(post, format: :json)
