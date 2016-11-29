class Catigory < ApplicationRecord
  has_many :catigory_products
  has_many :lemonaids, through: :catigory_products
end

