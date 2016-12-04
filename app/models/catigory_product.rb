class CatigoryProduct < ApplicationRecord
  belongs_to :catigory
  belongs_to :lemonaid

  validates :lemonaid_id, :catigory_id, 

end
 