json.extract! list, :id, :user_id, :title, :description, :visibility, :date_created, :date_updated, :created_at, :updated_at
json.url list_url(list, format: :json)
