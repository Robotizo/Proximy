json.extract! group_comment, :id, :content, :user_id, :group_post_id, :created_at, :updated_at
json.url group_comment_url(group_comment, format: :json)
