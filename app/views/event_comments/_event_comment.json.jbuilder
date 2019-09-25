json.extract! event_comment, :id, :content, :user_id, :event_post_id, :created_at, :updated_at
json.url event_comment_url(event_comment, format: :json)
