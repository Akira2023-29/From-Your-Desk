class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :diagnosis

  varidates :user_id, uniqueness: { scope: :diagnosis_id }
end
