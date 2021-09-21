json.extract! comment, :id, :list_id, :user_id, :text, :date_posted, :date_updated, :created_at, :updated_at
json.url comment_url(comment, format: :json)
