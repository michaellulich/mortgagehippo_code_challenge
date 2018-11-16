# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Coin.create(value: 0.01, name: "penny")
Coin.create(value: 0.05, name: "nickel")
Coin.create(value: 0.10, name: "dime")

User.create(name: "Mike", email: "michael.lulich@gmail.com", password: "password", admin: true, api_key: "aaa")
User.create(name: "George", email: "chicagomikecodes@gmail.com", password: "password", admin: true, api_key: "bbb")

# Transaction.create(user_id: 1, coin_id: 1, withdrawl: false)