require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
    let(:user) { create(:user) }
    let(:place) { create(:place) }
    let(:diagnosis) { build(:diagnosis, user: user, place: place) }

    context '正常系' do
        it 'すべてのフィールドが正常の場合、有効であること' do
            expect(diagnosis).to be_valid
        end
    end

    context '異常系' do
        it 'デスクワーク内容が未入力の場合、無効であること' do
            diagnosis.desk_work = nil
            expect(diagnosis).to be_invalid
            expect(diagnosis.errors[:desk_work]).to include('を入力してください')
        end

        it 'デスクワークの内容が256文字以上の場合、無効であること' do
            diagnosis.desk_work = 'a' * 256
            expect(diagnosis).to be_invalid
            expect(diagnosis.errors[:desk_work]).to include('は255文字以内で入力してください')
        end

        it 'デスク環境場所が未選択の場合、無効であること' do
            diagnosis.place_id = nil
            expect(diagnosis).to be_invalid
            expect(diagnosis.errors[:place_id]).to include('を入力してください')
        end

        it 'デスク写真が未設定の場合、無効であること' do
            diagnosis.desk_image = nil
            expect(diagnosis).to be_invalid
            expect(diagnosis.errors[:desk_image]).to include('を選択してください。')
        end
    end
end
