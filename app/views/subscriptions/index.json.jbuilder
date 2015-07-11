json.array!(@subscriptions) do |subscription|
  json.extract! subscription, :id, :first_name, :last_name, :street_address, :unit, :city, :state, :country, :postal_code, :user_id
  json.url subscription_url(subscription, format: :json)
end
