class User < ApplicationRecord
  has_many :transactions
  has_many :coins, through: :transactions
  has_secure_password
  validates :email, presence: true, uniqueness: true

  
end
