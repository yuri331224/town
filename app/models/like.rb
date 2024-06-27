class Like < ApplicationRecord
  belongs_to :town
  belongs_to :user
  validates_uniqueness_of :town_id, scope: :user_id
end
