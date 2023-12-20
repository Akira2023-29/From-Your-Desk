class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :diagnosis

  validates :user_id, uniqueness: { scope: :diagnosis_id }
end
