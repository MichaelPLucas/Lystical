json.extract! item, :id, :list_id, :title, :description, :image, :price, :currency, :link, :date_added, :created_at, :updated_at
json.url item_url(item, format: :json)
