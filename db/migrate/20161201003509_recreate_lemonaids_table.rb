class RecreateLemonaidsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :lemonaids do |t|
      t.string :name
      t.string :price
      t.string :image
      t.string :discription

      t.timestamps
    end
  end
end
