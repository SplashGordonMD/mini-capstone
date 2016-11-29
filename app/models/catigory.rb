class Catigory < ApplicationRecord
  has_many :catigory_products
  has_many :products, through: :catigory_products
end
