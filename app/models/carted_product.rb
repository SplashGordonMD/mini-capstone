class CartedProduct < ApplicationRecord
  belongs_to :user
  belongs_to :lemonaid
  belongs_to :order
end
