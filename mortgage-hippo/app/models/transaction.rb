class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :coin

  def self.total
    withdrawl_amount = Transaction.where(withdrawl: true).reduce(0){|sum, transaction| sum + transaction.coin.value}
    deposit_amount = Transaction.where(withdrawl: false).reduce(0){|sum, transaction| sum + transaction.coin.value}
    deposit_amount - withdrawl_amount 
  end

  def self.coin_count
    coins_obj = {
      "penny" => 0,
      "nickel" => 0,
      "dime" => 0,
      "quarter" => 0,
    }
    transactions = Transaction.all
    transactions.each{|transaction|
      coin_name = transaction.coin.name
      if !transaction.withdrawl 
        coins_obj[coin_name] += 1
      else
        coins_obj[coin_name] -= 1
      end
    }
    coins_obj
  end

end
