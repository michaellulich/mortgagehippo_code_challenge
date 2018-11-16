json.array! @users.each do |user|
  json.id user.id
  json.name user.name
  json.email user.email
  json.admin user.admin
  # json.transactions user.transactions.each do |transaction|
  #   json.transaction transaction.id
  # # json.coins user.coins.length
  # end
  # json.total_coins user.coins.each do |coin|
  #   json.coin_id coin.id
  #   json.value coin.value
  #   json.name coin.name
  #   json.withdrawl coin.transactions.map do |transaction|
  #     json.withdrawl transaction.withdrawl
  #   end
end

