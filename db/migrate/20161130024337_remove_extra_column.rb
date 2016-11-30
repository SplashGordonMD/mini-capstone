class RemoveExtraColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :lemonaids, :id, :integer
  end
end
