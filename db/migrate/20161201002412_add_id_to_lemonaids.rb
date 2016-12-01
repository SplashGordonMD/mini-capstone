class AddIdToLemonaids < ActiveRecord::Migration[5.0]
  def change
    add_column :lemonaids, :id, :integer
  end
end
