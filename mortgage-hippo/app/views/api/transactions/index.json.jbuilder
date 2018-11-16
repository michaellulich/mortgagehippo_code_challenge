json.total_amount Transaction.total
json.coin_counts Transaction.coin_count
json.transactions @transactions.each do |transaction|
  json.id transaction.id
  json.coin transaction.coin.name
  json.value transaction.coin.value
  json.withdrawl transaction.withdrawl
  json.date transaction.created_at
  json.user transaction.user.name
end