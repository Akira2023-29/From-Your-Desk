FactoryBot.define do
  factory :diagnosis do
    desk_work { "デスクワーク" }
    association :user
    association :place

    after(:build) do |diagnosis|
      diagnosis.desk_image = Rack::Test::UploadedFile.new('spec/fixtures/desk_image.jpg', 'image/jpeg')
    end
  end
end
