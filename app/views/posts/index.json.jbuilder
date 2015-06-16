json.array!(@posts) do |post|
  json.extract! post, :id, :topic_id, :content
  json.url post_url(post, format: :json)
end