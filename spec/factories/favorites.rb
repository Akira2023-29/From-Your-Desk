FactoryBot.define do
  factory :favorite do
    association :user
    association :diagnosis
  end
end
