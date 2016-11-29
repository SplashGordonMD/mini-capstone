class Lemonaid < ApplicationRecord
  has_many :orders
  has_many :catigory_products
  has_many :catigories, through: :catigory_products
end
