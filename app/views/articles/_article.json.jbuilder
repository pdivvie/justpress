json.extract! article, :id, :title, :body, :main_image, :thumb_image, :created_at, :updated_at
json.url article_url(article, format: :json)
