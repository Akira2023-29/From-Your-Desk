require 'rails_helper'

RSpec.describe Item, type: :model do
    context '正常系' do
        it 'アイテム画像、題名、カテゴリー、色分類、本文が選択・入力された場合、有効であること' do
        #     item = build(:item)
        #     expect(item).to be_valid
        end
    end

    context '異常系' do
        it '題名が未入力の場合、無効であること' do
        end

        it '題名の内容が256文字以上の場合、無効であること' do
        end

        it '本文が未入力の場合、無効であること' do
        end

        it '本文の内容が256文字以上の場合、無効であること' do
        end

        it 'カテゴリーが未選択の場合、無効であること' do
        end

        it '色部類が未選択の場合、無効であること' do
        end

        it '色部類を４種類以上選択した場合、無効であること' do
        end

        it 'アイテム写真が未設定の場合、無効であること' do
        end
    end
end
