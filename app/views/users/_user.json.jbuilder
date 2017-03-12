json.extract! user, :id, :first_name, :email, :second_name, :created_at, :latest_login, :created_at, :updated_at
json.url user_url(user, format: :json)
