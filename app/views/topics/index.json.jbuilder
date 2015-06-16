json.array!(@topics) do |topic|
  json.extract! topic, :id, :name, :sticky, :user_id
  json.url topic_url(topic, format: :json)
end
