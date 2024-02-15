FactoryBot.define do
  factory :user do
    name { "Akira" }
    sequence(:email) { |n| "rspec_#{n}@example.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
