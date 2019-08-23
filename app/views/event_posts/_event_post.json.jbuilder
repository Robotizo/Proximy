json.extract! event_post, :id, :content, :image, :event_id, :user_id, :created_at, :updated_at
json.url event_post_url(event_post, format: :json)
