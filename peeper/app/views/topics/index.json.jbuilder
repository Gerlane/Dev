json.array! @topics, partial: "topics/topic", as: :topic
json.url topic_url(topic, format: :json)
