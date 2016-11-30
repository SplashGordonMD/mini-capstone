class Order < ApplicationRecord
  belongs_to :user
  belongs_to :lemonaid
  has_many :orders
  has_many :carted_products
  has_many :products, through: :carted_products
end
