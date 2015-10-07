json.array!(@channels) do |channel|
  json.extract! channel, :id, :belongs_to, :name, :url
  json.url channel_url(channel, format: :json)
end
