class LemonaidPriceChange < ActiveRecord::Migration[5.0]
 def change 
  remove_column :lemonaids, :price, :string
  add_column :lemonaids, :price, :decimal, precision: 4, scale: 2
  end
end
