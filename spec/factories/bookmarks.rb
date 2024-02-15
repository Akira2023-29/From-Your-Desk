FactoryBot.define do
  factory :bookmark do
    association :user
    association :item
  end
end
