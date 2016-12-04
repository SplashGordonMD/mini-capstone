class Lemonaid < ApplicationRecord
  has_many :images
  has_many :orders
  has_many :catigory_products
  has_many :catigories, through: :catigory_products
  has_many :carted_products
  has_many :orders, through: :carted_products

  validates :name, price: true

  def tax
    price.to_f * 0.09    
  end

  def total
    price.to_f + tax
  end

  def discounted?
    price.to_f <10
  end
end