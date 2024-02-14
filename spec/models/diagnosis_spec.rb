require 'rails_helper'

RSpec.describe Diagnosis, type: :model do
    context '正常系' do
        it 'デスク画像、デスク環境選択、デスクワークが正常に選択・入力された場合、有効であること' do
            diagnosis = build(:diagnosis)
            expect(diagnosis).to be_valid
        end
    end

    context '異常系' do
        it 'デスクワーク内容が未入力の場合、無効であること' do
        end

        it 'デスクワークの内容が256文字以上の場合、無効であること' do
        end

        it 'デスク環境場所が未選択の場合、無効であること' do
        end

        it 'デスク写真が未設定の場合、無効であること' do
        end

        it 'デスクを含まない写真を設定した場合、無効であること' do
        end

        it '診断機能を同じ日に3回以上実施した場合、無効であること' do
        end
    end
end
