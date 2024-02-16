FactoryBot.define do
  factory :diagnosis do
    desk_work { "デスクワーク" }
    color_name { "赤" }
    result_en { "diagnosis_result" }
    result_jp { "診断結果" }
    association :user
    association :place

    after(:build) do |diagnosis|
      diagnosis.desk_image = Rack::Test::UploadedFile.new('spec/fixtures/desk_image.jpg', 'image/jpeg')
    end
  end
end
