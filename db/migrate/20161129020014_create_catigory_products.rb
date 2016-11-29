class CreateCatigoryProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :catigory_products do |t|
      t.integer :product_id
      t.integer :catigory_id

      t.timestamps
    end
  end
end
