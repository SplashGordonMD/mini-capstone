class Order < ApplicationRecord
  belongs_to :user
  belongs_to :lemonaid
  has_many :orders
  has_many :carted_products
  has_many :products, through: :carted_products

  def calculated_totals(input_carted_product)
    subtotals = 0
    input_carted_products.each do |carted_product|
      subtotal += carted_product.quantity * carted_product.product.price
    end
    tax = subtotal * 0.09
    total = subtotal + tax
    update(subtotal: subtotal, tax: tax, total: total)
  end
end