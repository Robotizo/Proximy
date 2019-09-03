json.extract! notification_event, :id, :event_id, :created_at, :updated_at
json.url notification_event_url(notification_event, format: :json)
