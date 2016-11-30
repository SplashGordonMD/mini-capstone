class CreateCarteds < ActiveRecord::Migration[5.0]
  def change
    create_table :carteds do |t|
      t.string :Product

      t.timestamps
    end
  end
end
