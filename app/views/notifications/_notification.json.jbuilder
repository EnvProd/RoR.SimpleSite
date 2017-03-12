json.extract! notification, :id, :message, :user_id, :type, :created_at, :updated_at
json.url notification_url(notification, format: :json)
