json.array!(@products) do |product|
  json.extract! product, :id, :channel_id, :title, :token, :price, :link
  json.url product_url(product, format: :json)
end
