json.extract! inbox_item, :id, :body, :status, :created_at, :updated_at
json.url inbox_item_url(inbox_item, format: :json)
