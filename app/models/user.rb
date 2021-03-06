class User < ApplicationRecord
  has_secure_password
  has_many :orders # A user can have many orders. Each order is associated with ONLY ONE USER.
  has_many :carted_products
  has_many :orders, through: :carted_products
end


