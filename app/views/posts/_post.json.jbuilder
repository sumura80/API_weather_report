json.extract! post, :id, :when, :tenki, :date, :max, :min, :image_url, :created_at, :updated_at
json.url post_url(post, format: :json)
