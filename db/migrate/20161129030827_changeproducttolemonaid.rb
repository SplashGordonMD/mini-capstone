class Changeproducttolemonaid < ActiveRecord::Migration[5.0]
  def change
    rename_column :catigory_products, :product_id, :lemonaid_id
  end

end
