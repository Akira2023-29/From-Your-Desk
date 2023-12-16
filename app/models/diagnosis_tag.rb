class DiagnosisTag < ApplicationRecord
  belongs_to :diagnosis
  belongs_to :tag
end
