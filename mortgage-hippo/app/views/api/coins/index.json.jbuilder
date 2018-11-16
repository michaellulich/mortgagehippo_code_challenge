json.array! @coins.each do |coin|
  json.id coin.id
  json.value coin.value
  json.name coin.name
  json.created_date coin.created_at
end

