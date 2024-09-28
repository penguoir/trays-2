json.extract! next_action, :id, :user_id, :project_id, :body, :done, :created_at, :updated_at
json.url next_action_url(next_action, format: :json)
