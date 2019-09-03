json.extract! feedback, :id, :body, :created_at, :updated_at
json.url feedback_url(feedback, format: :json)
